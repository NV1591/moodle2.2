<?php
// This file is made as extension to moodle 2.2 by EduPristine. 
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
 * Library for moodle implementation by edupristine
 *    
 * @author     Ankit Mittal
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later    
 */    

function get_cm_visibility_pristine($url) {
    $show = 0;
    if(isset($_GET["display"])) {      
        if($_GET["display"]=='all') {
            $show = 1;                      
        } elseif(($_GET["display"] == 'quiz') and (strpos($url, 'quiz') != false)) {
            $show = 1;
        } elseif(($_GET["display"] == 'page') and (strpos($url, 'page') != false)) {
            $show = 1;
        } elseif(($_GET["display"] == 'url') and (strpos($url, 'url') != false)) {
            $show = 1;
        }
    } else {
        $show = 1;
    }
    return $show;
}


function get_performance_grossscore($userid) {    
    global $DB;    
    $sql = "SELECT b.course,     
                   sum(a.sumgrades) as score,    
                   count(b.id) as attempted    
            FROM mdl_quiz_attempts a,     
                 mdl_quiz b     
            WHERE a.userid=?     
                  AND a.quiz=b.id     
            GROUP BY b.course";    
    $result = $DB->get_records_sql($sql, array($userid));    
    return $result;    
}    
    
function get_performance_totalquizes() {    
    global $DB;    
    $sql = "SELECT course,     
                   count(id) as totalquizes    
            FROM mdl_quiz    
            GROUP BY course";    
    $result = $DB->get_records_sql($sql);    
    return $result;    
}    

function get_performance_totalvideos() { 
    global $DB;
    $sql = "SELECT course, 
                   count(id) AS videos 
            FROM mdl_page 
            GROUP BY course";
    $result = $DB->get_records_sql($sql);
    return $result;
} 

function get_performance_viewedvideos($userid) { 
    global $DB;
    $sql = "SELECT course, 
                   count(DISTINCT info) as viewedvideos 
            FROM mdl_log 
            WHERE module='page' 
                AND action='view' 
                AND userid=? 
            GROUP BY course";
    $result = $DB->get_records_sql($sql, array($userid));
    return $result;
} 

function get_performance_totaltopics() { 
    global $DB;
    $sql = "SELECT course, 
                   count(id) AS totaltopics
            FROM mdl_course_sections 
            WHERE section>0 
            GROUP BY course";
    $result = $DB->get_records_sql($sql);
    return $result;
} 

function get_performance_percent_complete($userid,$total_vids =-1,
         $total_quiz =-1, $done_vids=-1, $done_quiz=-1) { 
    global$DB;
    if($total_vids = -1) { 
        $total_vids = get_performance_totalvideos();
        $total_quiz = get_performance_totalquizes();
        $done_vids = get_performance_viewedvideos($userid);
        $done_quiz = get_performance_grossscore($userid);
    } 
    $score = array();
    foreach ($total_vids as $course => $total_vids_by_course) { 
        if(!isset($total_quiz[$course])) {
            $total_quiz[$course] = new stdClass();
            $total_quiz[$course]->totalquizes = 0;
        }
        if(!isset($done_vids[$course])) {
            $done_vids[$course] = new stdClass();
            $done_vids[$course]->viewedvideos = 0;
        }
        if(!isset($done_quiz[$course])) { 
            $done_quiz[$course] = new stdClass();
            $done_quiz[$course]->attempted = 0;
        } 
        $percent_score[$course] = min(100,round(
        ($done_quiz[$course]->attempted + $done_vids[$course]->viewedvideos) /
        ($total_quiz[$course]->totalquizes + $total_vids[$course]->videos)
        *100));
    } 
    return $percent_score;
} 

function print_dashboard($course_list, $userid) {
    global $CFG;
    $total_topics = get_performance_totaltopics();
    $total_videos = get_performance_totalvideos();
    $total_quiz = get_performance_totalquizes();
    $done_videos = get_performance_viewedvideos($userid);
    $gross_score = get_performance_grossscore($userid);
    $percentage = get_performance_percent_complete($userid);
    foreach($course_list as $courseid=>$coursedata) {
        $topics_completed = 0;
        if(isset($total_quiz[$courseid])) {
            $total_quiz_this_course = $total_quiz[$courseid]->totalquizes;
        } else {
            $total_quiz_this_course = 0;
        }
        if(isset($done_videos[$courseid])) {
            $done_videos_this_course = $done_videos[$courseid]->viewedvideos;
        } else {
            $done_videos_this_course = 0;
        }
        if(isset($gross_score[$courseid])) {
            $score = $gross_score[$courseid]->score;
            $done_quiz_this_course = $gross_score[$courseid]->attempted;
        } else {
            $score = 0;
            $done_quiz_this_course = 0;
        }?>
        <div><div><a href='<?php echo
        $CFG->wwwroot . "/course/view.php?id=$courseid"; ?>'><h3><?php echo $coursedata->fullname; ?></h3></a>
        <table style='width:100%;'><tr height='25px'>
          <td width='20%'>Topics Completed &nbsp; &nbsp;</ td>              
          <td width='10%'><span>
            <?php echo $topics_completed;?>
          </span>/
            <?php echo $total_topics[$courseid]->totaltopics; ?>
          </td><td width='20%'>Gross Score &nbsp; &nbsp;</ td>              
          <td width='25%'<span>
          <?php echo round($score); ?>
          </span></td><td width='25%' align='center' valign='middle'>
          <span style='font-size:13px;'>
          <?php echo $percentage[$courseid]; ?>
          %</span> complete </td></tr><tr height='25px'>
          <td width='20%'>
          Videos Watched  &nbsp; &nbsp;</td>
          <td width='10%'><span>
          <?php echo $done_videos_this_course; ?>
          </span>/
          <?php echo $total_videos[$courseid]->videos;?>
          </span></td><td width='20%'>Tests Taken &nbsp;   &nbsp;</td>      
          <td width='25%'><span>
          <?php echo $done_videos_this_course; ?>
          </span>/
          <?php echo $total_quiz_this_course; ?>
          </td><td><div style='float:left;background:#cccccc;
                        height:12px;width:150px;'>
          <div style='float:left;background:green;height:12px;width:<?php echo
          $percentage[$courseid]; ?>%;
                      z-index:100;'></div></div> </td></tr>
          <tr>
          <td  height='35px' valign='middle'>&nbsp; </     td><td> </td>    
          <td colspan='2' align='right'  height='35px' valign='middle' >
          <a  href="<?php echo $CFG->wwwroot . '/course/view.php?id=' .           $courseid . '&display=quiz';?>"> Quiz </a> </td>
          <td align='right'><a href='<?php echo $CFG->wwwroot .
          "/course/view.php?id=$courseid&display=page"; ?>' style='margin-right: 35px;'> Video</a>
          </td></tr></table></div></div>
    <?php
    }
}

function if_a_page($url) {
    if(strpos($url, 'page')) {
        return true;
    } else {
        return false;
    }
}

function show_related_lessons($video_cmid, $courseid) {
    global $DB;
    if($video_cmid) {
        $sql_get_name = "SELECT b.name 
                         FROM mdl_course_modules a, 
                              mdl_page b
                         WHERE a.id=?
                            AND a.instance=b.id";
        $video_name = $DB->get_field_sql($sql_get_name, array($video_cmid));
        $sql_resource = "SELECT a.id,
                                b.intro
                         FROM mdl_course_modules a,
                              mdl_resource b
                         WHERE a.instance=b.id 
                            AND b.name=?
                            AND a.module=15     
                            AND a.course=?";
                            //15 module is for files
        $related_files = $DB->get_records_sql_menu($sql_resource, 
                              array($video_name,$courseid));
        $sql_quiz = "SELECT a.id 
                           ,b.intro
                     FROM mdl_course_modules a, 
                          mdl_quiz b 
                     WHERE a.instance=b.id 
                        AND b.name=? 
                        AND module=14 
                        AND a.course=?";  
                        //14 module is for quiz
        $related_quizes = $DB->get_records_sql_menu($sql_quiz,
                               array($video_name, $courseid));
        $sql_url = "SELECT a.id, 
                           b.intro 
                    FROM mdl_course_modules a, 
                         mdl_url b 
                    WHERE a.instance=b.id 
                        AND b.name=? 
                        AND module=18 
                        AND a.course=?";
                        //18 module is for urls
        $related_urls = $DB->get_records_sql_menu($sql_url,
                             array($video_name, $courseid));
        $related_lessons =  array('resources'=>$related_files,
                            'quizes'=>$related_quizes, 'urls'=>$related_urls);
        print_related_lessons($related_lessons);
    } else {
        //Mordor Code : One does not simply walk in here, send to log
    }
}

function print_related_lessons($lessons) {
    global $CFG;
    $files = $lessons['resources'];
    $quizes = $lessons['quizes'];
    $urls = $lessons['urls'];
    echo 'Related are .. </br>';
    if(!empty($files)) {
        foreach($files as $key=>$value) {
            $file_title = strip_tags($value);
            echo 'Lesson : <a href="' . $CFG->wwwroot .'/mod/resource/view.php?id=' . $key . '">' . $file_title . '</a></br>';
            }
    } 
    if(!empty($quizes)) {
        foreach($quizes as $key=>$value) {
            $quiz_title = strip_tags($value);
            echo 'Quiz : <a href="' . $CFG->wwwroot . '/mod/quiz/view.php?id=' . 
                  $key . '">' . $quiz_title . '</a></br>';
        }
    }
    if(!empty($urls)) {
        foreach($urls as $key=>$value) {
            $url_title = strip_tags($value);
            echo 'Links : <a href="' . $CFG->wwwroot . '/mod/url/view.php?id=' . 
                $key . '">' . $url_title . '</a></br>';
        }
    }

}
?>

