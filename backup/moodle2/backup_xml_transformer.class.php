<?php

// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * @package    moodlecore
 * @subpackage backup-moodle2
 * @copyright  2010 onwards Eloy Lafuente (stronk7) {@link http://stronk7.com}
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

/**
 * Class implementing the @xml_contenttrasnformed logic to be applied in moodle2 backups
 *
 * TODO: Finish phpdocs
 */
class backup_xml_transformer extends xml_contenttransformer {

    private $absolute_links_encoders; // array of static methods to be called in order to
                                      // perform the encoding of absolute links to all the
                                      // contents sent to xml
    private $courseid;                // courseid this content belongs to
    private $unicoderegexp;           // to know if the site supports unicode regexp

    public function __construct($courseid) {
        $this->absolute_links_encoders = array();
        $this->courseid = $courseid;
        // Check if we support unicode modifiers in regular expressions
        $this->unicoderegexp = @preg_match('/\pL/u', 'a'); // This will fail silently, returning false,
                                                           // if regexp libraries don't support unicode
        // Register all the available content link encoders
        $this->absolute_links_encoders = $this->register_link_encoders();
    }

    public function process($content) {

        // Array or object, debug and try our best recursively, shouldn't happen but...
        if (is_array($content)) {
            debugging('Backup XML transformer should process arrays but plain content always', DEBUG_DEVELOPER);
            foreach($content as $key => $plaincontent) {
                $content[$key] = $this->process($plaincontent);
            }
            return $content;
        } else if (is_object($content)) {
            debugging('Backup XML transformer should not process objects but plain content always', DEBUG_DEVELOPER);
            foreach((array)$content as $key => $plaincontent) {
                $content[$key] = $this->process($plaincontent);
            }
            return (object)$content;
        }

        if (is_null($content)) {  // Some cases we know we can skip complete processing
            return '$@NULL@$';
        } else if ($content === '') {
            return '';
        } else if (is_numeric($content)) {
            return $content;
        } else if (strlen($content) < 32) { // Impossible to have one link in 32cc
            return $content;                // (http://10.0.0.1/file.php/1/1.jpg, http://10.0.0.1/mod/url/view.php?id=)
        }

        $content = $this->process_filephp_links($content); // Replace all calls to file.php by $@FILEPHP@$ in a normalised way
        $content = $this->encode_absolute_links($content); // Pass the content against all the found encoders

        return $content;
    }

    private function process_filephp_links($content) {
        global $CFG;

        if (strpos($content, 'file.php') === false) { // No file.php, nothing to convert
            return $content;
        }

        //First, we check for every call to file.php inside the course
        $search = array($CFG->wwwroot.'/file.php/' . $this->courseid,
                        $CFG->wwwroot.'/file.php?file=/' . $this->courseid,
                        $CFG->wwwroot.'/file.php?file=%2f' . $this->courseid,
                        $CFG->wwwroot.'/file.php?file=%2F' . $this->courseid);
        $replace = array('$@FILEPHP@$', '$@FILEPHP@$', '$@FILEPHP@$', '$@FILEPHP@$');
        $content = str_replace($search, $replace, $content);

        // Now we look for any '$@FILEPHP@$' URLs, replacing:
        //     - slashes and %2F by $@SLASH@$
        //     - &forcedownload=1 &amp;forcedownload=1 and ?forcedownload=1 by $@FORCEDOWNLOAD@$
        // This way, backup contents will be neutral and independent of slasharguments configuration. MDL-18799
        // Based in $this->unicoderegexp, decide the regular expression to use
        if ($this->unicoderegexp) { //We can use unicode modifiers
            $search = '/(\$@FILEPHP@\$)((?:(?:\/|%2f|%2F))(?:(?:\([-;:@#&=\pL0-9\$~_.+!*\',]*?\))|[-;:@#&=\pL0-9\$~_.+!*\',]|%[a-fA-F0-9]{2}|\/)*)?(\?(?:(?:(?:\([-;:@#&=\pL0-9\$~_.+!*\',]*?\))|[-;:@#&=?\pL0-9\$~_.+!*\',]|%[a-fA-F0-9]{2}|\/)*))?(?<![,.;])/u';
        } else { //We cannot ue unicode modifiers
            $search = '/(\$@FILEPHP@\$)((?:(?:\/|%2f|%2F))(?:(?:\([-;:@#&=a-zA-Z0-9\$~_.+!*\',]*?\))|[-;:@#&=a-zA-Z0-9\$~_.+!*\',]|%[a-fA-F0-9]{2}|\/)*)?(\?(?:(?:(?:\([-;:@#&=a-zA-Z0-9\$~_.+!*\',]*?\))|[-;:@#&=?a-zA-Z0-9\$~_.+!*\',]|%[a-fA-F0-9]{2}|\/)*))?(?<![,.;])/';
        }
        $content = preg_replace_callback($search, array('backup_xml_transformer', 'process_filephp_uses'), $content);

        return $content;
    }

    private function encode_absolute_links($content) {
        foreach ($this->absolute_links_encoders as $classname => $methodname) {
            $content = call_user_func(array($classname, $methodname), $content);
        }
        return $content;
    }

    static private function process_filephp_uses($matches) {

        // Replace slashes (plain and encoded) and forcedownload=1 parameter
        $search = array('/', '%2f', '%2F', '?forcedownload=1', '&forcedownload=1', '&amp;forcedownload=1');
        $replace = array('$@SLASH@$', '$@SLASH@$', '$@SLASH@$', '$@FORCEDOWNLOAD@$', '$@FORCEDOWNLOAD@$', '$@FORCEDOWNLOAD@$');

        $result = $matches[1] . (isset($matches[2]) ? str_replace($search, $replace, $matches[2]) : '') . (isset($matches[3]) ? str_replace($search, $replace, $matches[3]) : '');

        return $result;
    }

    private function register_link_encoders() {
        $encoders = array();

        // Add the course encoder
        $encoders['backup_course_task'] = 'encode_content_links';

        // Add the module ones. Each module supporting moodle2 backups MUST have it
        $mods = get_plugin_list('mod');
        foreach ($mods as $mod => $moddir) {
            if (plugin_supports('mod', $mod, FEATURE_BACKUP_MOODLE2)) {
                $encoders['backup_' . $mod . '_activity_task'] = 'encode_content_links';
            }
        }

        // Add the block encoders
        $blocks = get_plugin_list('block');
        foreach ($blocks as $block => $blockdir) {
            if (class_exists('backup_' . $block . '_block_task')) {
                $encoders['backup_' . $block . '_block_task'] = 'encode_content_links';
            }
        }

        // Add the course format encodes
        // TODO: Same than blocks, need to know how courseformats are going to handle backup
        //       (1.9 was based in backuplib function, see code)

        // Add local encodes
        // TODO: Any interest? 1.9 never had that.

        return $encoders;
    }
}
