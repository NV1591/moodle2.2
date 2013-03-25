-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2013 at 02:58 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `timedue` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numfiles` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data1` text,
  `data2` text,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `teacher` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemarked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) unsigned NOT NULL,
  `purpose` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `status` smallint(4) unsigned NOT NULL,
  `execution` smallint(4) unsigned NOT NULL,
  `executiontime` bigint(10) unsigned NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `info` mediumtext,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `itemname` varchar(160) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `newitemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) unsigned DEFAULT NULL,
  `info` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) unsigned NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=39 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2011112900, 0, 0, 1),
(2, 'admin_bookmarks', 2011112900, 0, 0, 1),
(3, 'blog_menu', 2011112900, 0, 0, 1),
(4, 'blog_recent', 2011112900, 0, 0, 1),
(5, 'blog_tags', 2011112900, 0, 0, 1),
(6, 'calendar_month', 2011112900, 0, 0, 1),
(7, 'calendar_upcoming', 2011112900, 0, 0, 1),
(8, 'comments', 2011112900, 0, 0, 1),
(9, 'community', 2011112900, 0, 0, 1),
(10, 'completionstatus', 2011112900, 0, 0, 1),
(11, 'course_list', 2011112900, 0, 0, 1),
(12, 'course_overview', 2011112900, 0, 0, 1),
(13, 'course_summary', 2011112900, 0, 0, 1),
(14, 'feedback', 2011112900, 0, 0, 0),
(15, 'glossary_random', 2011112900, 0, 0, 1),
(16, 'html', 2011112900, 0, 0, 1),
(17, 'login', 2011112900, 0, 0, 1),
(18, 'mentees', 2011112900, 0, 0, 1),
(19, 'messages', 2011112900, 0, 0, 1),
(20, 'mnet_hosts', 2011112900, 0, 0, 1),
(21, 'myprofile', 2011112900, 0, 0, 1),
(22, 'navigation', 2011112900, 0, 0, 1),
(23, 'news_items', 2011112900, 0, 0, 1),
(24, 'online_users', 2011112900, 0, 0, 1),
(25, 'participants', 2011112900, 0, 0, 1),
(26, 'private_files', 2011112900, 0, 0, 1),
(27, 'quiz_results', 2011112900, 0, 0, 1),
(28, 'recent_activity', 2011112900, 0, 0, 1),
(29, 'rss_client', 2011112900, 300, 0, 1),
(30, 'search_forums', 2011112900, 0, 0, 1),
(31, 'section_links', 2011112900, 0, 0, 1),
(32, 'selfcompletion', 2011112900, 0, 0, 1),
(33, 'settings', 2011112900, 0, 0, 1),
(34, 'site_main_menu', 2011112900, 0, 0, 1),
(35, 'social_activities', 2011112900, 0, 0, 1),
(36, 'tag_flickr', 2011112900, 0, 0, 1),
(37, 'tag_youtube', 2011112900, 0, 0, 1),
(38, 'tags', 2011112900, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) unsigned NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` text,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `shared` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `blogid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `url` text NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `timefetched` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  `expiry` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1364029233, '1', 1364036433),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1364197737, '1', 1364204937),
(3, 'accesslib/dirtycontexts', '/1/3/20', 1364197743, '1', 1364204943),
(4, 'accesslib/dirtycontexts', '/1/3/15/16', 1364037370, '1', 1364044570),
(5, 'accesslib/dirtycontexts', '/1/3/15/17', 1364037419, '1', 1364044619),
(6, 'accesslib/dirtycontexts', '/1/3/20/21', 1364037457, '1', 1364044657),
(7, 'accesslib/dirtycontexts', '/1/3/20/22', 1364037467, '1', 1364044667),
(8, 'accesslib/dirtycontexts', '/1/3/20/23', 1364037531, '1', 1364044731),
(9, 'accesslib/dirtycontexts', '/1/3/20/24', 1364037566, '1', 1364044766),
(10, 'accesslib/dirtycontexts', '/1/3/20/25', 1364193621, '1', 1364200821),
(11, 'accesslib/dirtycontexts', '/1/3/15/26', 1364194737, '1', 1364201937),
(12, 'accesslib/dirtycontexts', '/1/3/15/19', 1364196138, '1', 1364203338),
(13, 'accesslib/dirtycontexts', '/1/3/15/18', 1364196148, '1', 1364203348),
(14, 'userpreferenceschanged', '3', 1364197630, '1', 1364204830);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '63e78d09f258fd7d64cda89e9c0f2f9b', '<div class="no-overflow"><p>&lt;p&gt;&lt;video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="" data-setup="{}"&gt; &lt;source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Fixed%20Income/53_b/Video/53_b.mp4" type="video/mp4" /&gt; &lt;/video&gt;&lt;/p&gt;</p></div>', 1364039647),
(2, 'f77a8b30418c81e6ad81cb4095f6ec24', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Fixed%20Income/53_a/Video/53_a.mp4" type="video/mp4" /> </video></p></div>', 1364196817),
(3, 'c55aff7ba61b9f756860a63cf37cbc1b', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Fixed%20Income/53_b/Video/53_b.mp4" type="video/mp4" /> </video></p></div>', 1364196815),
(4, 'cc70f5bbaf4f0d76cdf2dac431fd8aaf', '<div class="no-overflow"><p>&lt;p&gt;&lt;video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/FirstFrame.png" data-setup="{}"&gt; &lt;source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/CreatingALayout.mp4" type="video/mp4" /&gt; &lt;/video&gt;&lt;/p&gt;</p></div>', 1364193998),
(5, 'f9a4786ad459e0def74843d852c01380', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/CreatingALayout.mp4" type="video/mp4" /> </video></p></div>', 1364201670),
(6, '2d5f64c03ed02e787a284302980cda7c', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/CreatingALayout.mp4" type="video/mp4" /> </video></p></div>', 1364194525),
(7, '1eefe5b6b5f70b633268b6deb5af688a', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Excel%20Shortcuts/Video%20File/Excel-Shortcuts/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Excel%20Shortcuts/Video%20File/Excel-Shortcuts/Excel-Shortcuts.mp4" type="video/mp4" /> </video></p></div>', 1364194605),
(8, 'f9177614853b053892590093244e427e', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Referencing%20Framework%20In%20Excel/Video/Excel-Referencing/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Referencing%20Framework%20In%20Excel/Video/Excel-Referencing/Excel-Referencing.mp4" type="video/mp4" /> </video></p></div>', 1364194607),
(9, '99f48ec8b8e59cb5397c2247d64472e2', '<div class="no-overflow"><p>Quiz related to the video titled</p>\r\n<p><span style="font-size: 1.5em; line-height: 1.231;">Itroduction To Cash Flow Statement</span></p></div>', 1364194481),
(10, 'ac7e2e09dc44c8ebb8e31304f2d05eeb', '<div class="no-overflow"><h2 id="pageheading" class="main">Creating A Layout For Integrated Model</h2></div>', 1364194552),
(11, 'c039491ac638329262505962fda1baaa', '<div class="no-overflow"><h2 id="pageheading" class="main">Excel Shortcuts</h2></div>', 1364194634),
(12, 'f06d22446d23692afaf954bc5b06d264', '<div class="no-overflow"><h2 id="pageheading" class="main">Referencing Framework In Excel</h2></div>', 1364194669),
(13, '540adcd812fd630006355a79f91b9e76', '<div class="no-overflow"><h2 id="pageheading" class="main">Bond Indenture, Affirmative and Negative Convenants</h2></div>', 1364197079),
(14, 'f5c5acaa862b76273a94d46a1d2b7e9a', '<div class="no-overflow"><h2 id="pageheading" class="main">Bond Features, Coupon Structures, Floating Rate Securities</h2></div>', 1364194925),
(15, 'd3c8cbda8a717c127c858ac5a6c700eb', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Ethics/1_a/Video/1_a.mp4" type="video/mp4" /> </video></p></div>', 1364196636),
(16, 'd53a8a1c1910fa1740767fddb3881d33', '<div class="no-overflow"><p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Ethics/1_bc/Video/1_bc.mp4" type="video/mp4" /> </video></p></div>', 1364196638),
(17, 'cf9e495aa700b42d526956c2a8274957', '<div class="no-overflow"><h2 id="pageheading" class="main">Description of CFAI Professional Conduct Program</h2></div>', 1364197165),
(18, '78797ea3f2a0bf9d68fa9eee3fb58e00', '<div class="no-overflow"><h2 id="pageheading" class="main">Basics of Code of Ethics and Professional Standards</h2></div>', 1364197168),
(19, '7e36c894d20629bc142ae8626e8a28f5', '<div class="no-overflow"><div class="text_to_html"><p>iho</p></div></div>', 1364202551),
(20, '48514d08e05f6ddc9eea9a7c103fd2e6', '<p>iho</p>', 1364202551),
(21, 'ed1f1abeb07e92c378b893dcbf0daa48', '<div class="no-overflow"><p>uh</p></div>', 1364202551),
(22, '8c3169314fb01cf1f142e6a22fad96a8', '<div class="no-overflow"><p>something</p></div>', 1364202551),
(23, '6132476d8ee1e45846c28b46ade0c129', '<div class="no-overflow"><p>uh</p></div>', 1364201919),
(24, 'c3fa59a6a6978f7b6705ce8f05cd27aa', '<div class="no-overflow"><p>something</p></div>', 1364201919);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=380 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(45, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(46, 'moodle/role:review', 'read', 50, 'moodle', 8),
(47, 'moodle/role:override', 'write', 50, 'moodle', 28),
(48, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(49, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(50, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(51, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(52, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(53, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(54, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(56, 'moodle/course:create', 'write', 40, 'moodle', 4),
(57, 'moodle/course:request', 'write', 10, 'moodle', 0),
(58, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(59, 'moodle/course:update', 'write', 50, 'moodle', 4),
(60, 'moodle/course:view', 'read', 50, 'moodle', 0),
(61, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(62, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(63, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(64, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(65, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(66, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(67, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(68, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(69, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(70, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(71, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(72, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(73, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(74, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(77, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(78, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(79, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(80, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(81, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(82, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(83, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(84, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(85, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(86, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(87, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(88, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(89, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(90, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(91, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(92, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(93, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(94, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(95, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(96, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(97, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(98, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(99, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(100, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(101, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(102, 'moodle/question:add', 'write', 50, 'moodle', 20),
(103, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(104, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(105, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(106, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(107, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(108, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(109, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(110, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(111, 'moodle/question:config', 'write', 10, 'moodle', 2),
(112, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(113, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(114, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(115, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(116, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(117, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(118, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(119, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(120, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(121, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(122, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(123, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(124, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(125, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(126, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(127, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(128, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(129, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(130, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(131, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(132, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(133, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(134, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(135, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(136, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(137, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(138, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(139, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(140, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(141, 'moodle/block:view', 'read', 80, 'moodle', 0),
(142, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(143, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(144, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(145, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(146, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(147, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(148, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(149, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(150, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(151, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(152, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(153, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(154, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(155, 'moodle/community:add', 'write', 10, 'moodle', 0),
(156, 'moodle/community:download', 'write', 10, 'moodle', 0),
(157, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(158, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(159, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(160, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(161, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(162, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(163, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(164, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(165, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(166, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(167, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(168, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(169, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(170, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(171, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(172, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(173, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(174, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(175, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(176, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(177, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(178, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(179, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(180, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(181, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(182, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(183, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(184, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(185, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(186, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(187, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(188, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(189, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(190, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(191, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(192, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(193, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(194, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(195, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(196, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(197, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(198, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(199, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(200, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(201, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(202, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(203, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(204, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(205, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(206, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(207, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(208, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(209, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(210, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(211, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(212, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(213, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(214, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(215, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(216, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(217, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(218, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(219, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(220, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(221, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(222, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(223, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(224, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(225, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(226, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(227, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(228, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(229, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(230, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(231, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(232, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(233, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(234, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(235, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(236, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(237, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(238, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(239, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(240, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(241, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(242, 'mod/lti:grade', 'write', 70, 'mod_lti', 4),
(243, 'mod/lti:manage', 'write', 70, 'mod_lti', 4),
(244, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(245, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(246, 'mod/page:view', 'read', 70, 'mod_page', 0),
(247, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(248, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(249, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(250, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(251, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(252, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(253, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(254, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(255, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(256, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(257, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(258, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(259, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(260, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(261, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(262, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(263, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(264, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(265, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(266, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(267, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(268, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(269, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(270, 'mod/url:view', 'read', 70, 'mod_url', 0),
(271, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(272, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(273, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(274, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(275, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(276, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(277, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(278, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(279, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(280, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(281, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(282, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(283, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(284, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(285, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(286, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(287, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(288, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(289, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(290, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(291, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(292, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(293, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(294, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(295, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(296, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(297, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(298, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(299, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(300, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(301, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(302, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(303, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(304, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(305, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(306, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(307, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(308, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(309, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(310, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(311, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(312, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(313, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(314, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(315, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(316, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(317, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(318, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(319, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(320, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(321, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(322, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(323, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(324, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(325, 'report/completion:view', 'read', 50, 'report_completion', 8),
(326, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(327, 'report/log:view', 'read', 50, 'report_log', 8),
(328, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(329, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(330, 'report/outline:view', 'read', 50, 'report_outline', 8),
(331, 'report/participation:view', 'read', 50, 'report_participation', 8),
(332, 'report/progress:view', 'read', 50, 'report_progress', 8),
(333, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(334, 'report/security:view', 'read', 10, 'report_security', 2),
(335, 'report/stats:view', 'read', 50, 'report_stats', 8),
(336, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(337, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(338, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(339, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(340, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(341, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(342, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(343, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(344, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(345, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(346, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(347, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(348, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(349, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(350, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(351, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(352, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(353, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(354, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(355, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(356, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(357, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(358, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(359, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(360, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(361, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(362, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(363, 'repository/local:view', 'read', 70, 'repository_local', 0),
(364, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(365, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(366, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(367, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(368, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(369, 'repository/url:view', 'read', 70, 'repository_url', 0),
(370, 'repository/user:view', 'read', 70, 'repository_user', 0),
(371, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(372, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(373, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(374, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(375, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(376, 'tool/unittest:execute', 'write', 10, 'tool_unittest', 32),
(377, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(378, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(379, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showresults` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `optionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `text` text,
  `maxanswers` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=388 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'pristine'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'e3Q7iJwgSgoDyflftsmHoy5Whl8xMZINlocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '288'),
(21, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(22, 'version', '2011120509'),
(23, 'enableoutcomes', '0'),
(24, 'usecomments', '1'),
(25, 'usetags', '1'),
(26, 'enablenotes', '1'),
(27, 'enableportfolios', '0'),
(28, 'enablewebservices', '0'),
(29, 'messaging', '1'),
(30, 'messaginghidereadnotifications', '0'),
(31, 'messagingdeletereadnotificationsdelay', '604800'),
(32, 'enablestats', '0'),
(33, 'enablerssfeeds', '0'),
(34, 'bloglevel', '4'),
(35, 'enablecompletion', '0'),
(36, 'enableavailability', '0'),
(37, 'enableplagiarism', '0'),
(38, 'autologinguests', '0'),
(39, 'hiddenuserfields', ''),
(40, 'showuseridentity', 'email'),
(41, 'enablegravatar', '0'),
(42, 'gravatardefaulturl', 'mm'),
(43, 'enablecourserequests', '0'),
(44, 'defaultrequestcategory', '1'),
(45, 'courserequestnotify', ''),
(46, 'grade_profilereport', 'user'),
(47, 'grade_aggregationposition', '1'),
(48, 'grade_includescalesinaggregation', '1'),
(49, 'grade_hiddenasdate', '0'),
(50, 'gradepublishing', '0'),
(51, 'grade_export_displaytype', '1'),
(52, 'grade_export_decimalpoints', '2'),
(53, 'grade_navmethod', '0'),
(54, 'gradeexport', ''),
(55, 'unlimitedgrades', '0'),
(56, 'grade_hideforcedsettings', '1'),
(57, 'grade_aggregation', '11'),
(58, 'grade_aggregation_flag', '0'),
(59, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(60, 'grade_aggregateonlygraded', '1'),
(61, 'grade_aggregateonlygraded_flag', '2'),
(62, 'grade_aggregateoutcomes', '0'),
(63, 'grade_aggregateoutcomes_flag', '2'),
(64, 'grade_aggregatesubcats', '0'),
(65, 'grade_aggregatesubcats_flag', '2'),
(66, 'grade_keephigh', '0'),
(67, 'grade_keephigh_flag', '3'),
(68, 'grade_droplow', '0'),
(69, 'grade_droplow_flag', '2'),
(70, 'grade_displaytype', '1'),
(71, 'grade_decimalpoints', '2'),
(72, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(73, 'grade_report_studentsperpage', '100'),
(74, 'grade_report_quickgrading', '1'),
(75, 'grade_report_showquickfeedback', '0'),
(76, 'grade_report_fixedstudents', '0'),
(77, 'grade_report_meanselection', '1'),
(78, 'grade_report_enableajax', '0'),
(79, 'grade_report_showcalculations', '0'),
(80, 'grade_report_showeyecons', '0'),
(81, 'grade_report_showaverages', '1'),
(82, 'grade_report_showlocks', '0'),
(83, 'grade_report_showranges', '0'),
(84, 'grade_report_showanalysisicon', '1'),
(85, 'grade_report_showuserimage', '1'),
(86, 'grade_report_showactivityicons', '1'),
(87, 'grade_report_shownumberofgrades', '0'),
(88, 'grade_report_averagesdisplaytype', 'inherit'),
(89, 'grade_report_rangesdisplaytype', 'inherit'),
(90, 'grade_report_averagesdecimalpoints', 'inherit'),
(91, 'grade_report_rangesdecimalpoints', 'inherit'),
(92, 'grade_report_overview_showrank', '0'),
(93, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(94, 'grade_report_user_showrank', '0'),
(95, 'grade_report_user_showpercentage', '1'),
(96, 'grade_report_user_showgrade', '1'),
(97, 'grade_report_user_showfeedback', '1'),
(98, 'grade_report_user_showrange', '1'),
(99, 'grade_report_user_showweight', '0'),
(100, 'grade_report_user_showaverage', '0'),
(101, 'grade_report_user_showlettergrade', '0'),
(102, 'grade_report_user_rangedecimals', '0'),
(103, 'grade_report_user_showhiddenitems', '1'),
(104, 'grade_report_user_showtotalsifcontainhidden', '0'),
(105, 'timezone', '99'),
(106, 'forcetimezone', '99'),
(107, 'country', '0'),
(108, 'defaultcity', ''),
(109, 'geoipfile', '/home/ankit/Documents/moodledata/geoip/GeoLiteCity.dat'),
(110, 'googlemapkey', ''),
(111, 'allcountrycodes', ''),
(112, 'autolang', '1'),
(113, 'lang', 'en'),
(114, 'langmenu', '1'),
(115, 'langlist', ''),
(116, 'langcache', '1'),
(117, 'langstringcache', '1'),
(118, 'locale', ''),
(119, 'latinexcelexport', '0'),
(121, 'authpreventaccountcreation', '0'),
(122, 'loginpageautofocus', '0'),
(123, 'guestloginbutton', '1'),
(124, 'alternateloginurl', ''),
(125, 'forgottenpasswordurl', ''),
(126, 'auth_instructions', ''),
(127, 'allowemailaddresses', ''),
(128, 'denyemailaddresses', ''),
(129, 'verifychangedemail', '1'),
(130, 'recaptchapublickey', ''),
(131, 'recaptchaprivatekey', ''),
(132, 'sitedefaultlicense', 'allrightsreserved'),
(133, 'cachetext', '60'),
(134, 'filteruploadedfiles', '0'),
(135, 'filtermatchoneperpage', '0'),
(136, 'filtermatchonepertext', '0'),
(137, 'filter_multilang_force_old', '0'),
(138, 'filter_mediaplugin_enable_youtube', '1'),
(139, 'filter_mediaplugin_enable_vimeo', '0'),
(140, 'filter_mediaplugin_enable_mp3', '1'),
(141, 'filter_mediaplugin_enable_flv', '1'),
(142, 'filter_mediaplugin_enable_swf', '1'),
(143, 'filter_mediaplugin_enable_html5audio', '0'),
(144, 'filter_mediaplugin_enable_html5video', '0'),
(145, 'filter_mediaplugin_enable_qt', '1'),
(146, 'filter_mediaplugin_enable_wmp', '1'),
(147, 'filter_mediaplugin_enable_rm', '1'),
(148, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(149, 'filter_tex_latexbackground', '#FFFFFF'),
(150, 'filter_tex_density', '120'),
(151, 'filter_tex_pathlatex', '/usr/bin/latex'),
(152, 'filter_tex_pathdvips', '/usr/bin/dvips'),
(153, 'filter_tex_pathconvert', '/usr/bin/convert'),
(154, 'filter_tex_convertformat', 'gif'),
(155, 'filter_censor_badwords', ''),
(156, 'portfolio_moderate_filesize_threshold', '1048576'),
(157, 'portfolio_high_filesize_threshold', '5242880'),
(158, 'portfolio_moderate_db_threshold', '20'),
(159, 'portfolio_high_db_threshold', '50'),
(160, 'repositorycacheexpire', '120'),
(161, 'repositoryallowexternallinks', '1'),
(162, 'legacyfilesinnewcourses', '0'),
(163, 'enablewsdocumentation', '0'),
(164, 'allowbeforeblock', '0'),
(165, 'allowedip', ''),
(166, 'blockedip', ''),
(167, 'protectusernames', '1'),
(168, 'forcelogin', '0'),
(169, 'forceloginforprofiles', '1'),
(170, 'forceloginforprofileimage', '0'),
(171, 'opentogoogle', '0'),
(172, 'maxbytes', '0'),
(173, 'userquota', '104857600'),
(174, 'allowobjectembed', '0'),
(175, 'enabletrusttext', '0'),
(176, 'maxeditingtime', '1800'),
(177, 'fullnamedisplay', 'language'),
(178, 'extendedusernamechars', '0'),
(179, 'sitepolicy', ''),
(180, 'sitepolicyguest', ''),
(181, 'keeptagnamecase', '1'),
(182, 'profilesforenrolledusersonly', '1'),
(183, 'cronclionly', '0'),
(184, 'cronremotepassword', ''),
(185, 'passwordpolicy', '1'),
(186, 'minpasswordlength', '8'),
(187, 'minpassworddigits', '1'),
(188, 'minpasswordlower', '1'),
(189, 'minpasswordupper', '1'),
(190, 'minpasswordnonalphanum', '1'),
(191, 'maxconsecutiveidentchars', '0'),
(192, 'groupenrolmentkeypolicy', '1'),
(193, 'disableuserimages', '0'),
(194, 'emailchangeconfirmation', '1'),
(195, 'rememberusername', '2'),
(196, 'strictformsrequired', '0'),
(197, 'loginhttps', '0'),
(198, 'cookiesecure', '0'),
(199, 'cookiehttponly', '0'),
(200, 'allowframembedding', '0'),
(201, 'loginpasswordautocomplete', '0'),
(202, 'restrictmodulesfor', 'none'),
(203, 'restrictbydefault', '0'),
(204, 'displayloginfailures', ''),
(205, 'notifyloginfailures', ''),
(206, 'notifyloginthreshold', '10'),
(207, 'runclamonupload', '0'),
(208, 'pathtoclam', ''),
(209, 'quarantinedir', ''),
(210, 'clamfailureonupload', 'donothing'),
(211, 'themelist', ''),
(212, 'themedesignermode', '1'),
(213, 'allowuserthemes', '0'),
(214, 'allowcoursethemes', '0'),
(215, 'allowcategorythemes', '0'),
(216, 'allowthemechangeonurl', '0'),
(217, 'allowuserblockhiding', '1'),
(218, 'allowblockstodock', '1'),
(219, 'custommenuitems', ''),
(220, 'enabledevicedetection', '1'),
(221, 'devicedetectregex', '[]'),
(222, 'calendar_adminseesall', '0'),
(223, 'calendar_site_timeformat', '0'),
(224, 'calendar_startwday', '0'),
(225, 'calendar_weekend', '65'),
(226, 'calendar_lookahead', '21'),
(227, 'calendar_maxevents', '10'),
(228, 'enablecalendarexport', '1'),
(229, 'calendar_exportsalt', 'GZrSTKoHj9O06qK6Qj88u7twCqhc2u1v5UZLjqRG9X5VzGjmg7ouK9FGkO5H'),
(230, 'useblogassociations', '1'),
(231, 'useexternalblogs', '1'),
(232, 'externalblogcrontime', '86400'),
(233, 'maxexternalblogsperuser', '1'),
(234, 'blogusecomments', '1'),
(235, 'blogshowcommentscount', '1'),
(236, 'defaulthomepage', '0'),
(237, 'navshowcategories', '1'),
(238, 'navshowallcourses', '0'),
(239, 'navcourselimit', '20'),
(240, 'navlinkcoursesections', '0'),
(241, 'usesitenameforsitepages', '0'),
(242, 'navadduserpostslinks', '1'),
(243, 'formatstringstriptags', '1'),
(244, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(245, 'docroot', 'http://docs.moodle.org'),
(246, 'doctonewwindow', '0'),
(247, 'courselistshortnames', '0'),
(248, 'enableajax', '1'),
(249, 'useexternalyui', '0'),
(250, 'yuicomboloading', '1'),
(251, 'cachejs', '1'),
(252, 'enablecourseajax', '1'),
(253, 'additionalhtmlhead', ''),
(254, 'additionalhtmltopofbody', ''),
(255, 'additionalhtmlfooter', ''),
(256, 'gdversion', '2'),
(257, 'pathtodu', ''),
(258, 'aspellpath', ''),
(259, 'pathtodot', ''),
(260, 'supportpage', ''),
(261, 'dbsessions', '1'),
(262, 'sessioncookie', ''),
(263, 'sessioncookiepath', ''),
(264, 'sessioncookiedomain', ''),
(265, 'statsfirstrun', 'none'),
(266, 'statsmaxruntime', '0'),
(267, 'statsruntimedays', '31'),
(268, 'statsruntimestarthour', '0'),
(269, 'statsruntimestartminute', '0'),
(270, 'statsuserthreshold', '0'),
(271, 'slasharguments', '1'),
(272, 'getremoteaddrconf', '0'),
(273, 'proxyhost', ''),
(274, 'proxyport', '0'),
(275, 'proxytype', 'HTTP'),
(276, 'proxyuser', ''),
(277, 'proxypassword', ''),
(278, 'proxybypass', 'localhost, 127.0.0.1'),
(279, 'maintenance_enabled', '0'),
(280, 'maintenance_message', ''),
(281, 'deleteunconfirmed', '168'),
(282, 'deleteincompleteusers', '0'),
(283, 'logguests', '1'),
(284, 'loglifetime', '0'),
(285, 'disablegradehistory', '0'),
(286, 'gradehistorylifetime', '0'),
(287, 'numcoursesincombo', '500'),
(288, 'extramemorylimit', '512M'),
(289, 'curlcache', '120'),
(290, 'curltimeoutkbitrate', '56'),
(291, 'enablesafebrowserintegration', '0'),
(292, 'enablegroupmembersonly', '0'),
(293, 'debug', '38911'),
(294, 'debugdisplay', '0'),
(295, 'xmlstrictheaders', '0'),
(296, 'debugsmtp', '0'),
(297, 'perfdebug', '7'),
(298, 'debugstringids', '0'),
(299, 'debugvalidators', '0'),
(300, 'debugpageinfo', '0'),
(301, 'release', '2.2.9 (Build: 20130318)'),
(302, 'jsrev', '281'),
(304, 'notloggedinroleid', '6'),
(305, 'guestroleid', '6'),
(306, 'defaultuserroleid', '7'),
(307, 'creatornewroleid', '3'),
(308, 'restorernewroleid', '3'),
(309, 'gradebookroles', '5'),
(310, 'assignment_maxbytes', '1048576'),
(311, 'assignment_itemstocount', '1'),
(312, 'assignment_showrecentsubmissions', '1'),
(313, 'chat_method', 'ajax'),
(314, 'chat_refresh_userlist', '10'),
(315, 'chat_old_ping', '35'),
(316, 'chat_refresh_room', '5'),
(317, 'chat_normal_updatemode', 'jsupdate'),
(318, 'chat_serverhost', 'localhost'),
(319, 'chat_serverip', '127.0.0.1'),
(320, 'chat_serverport', '9111'),
(321, 'chat_servermax', '100'),
(322, 'data_enablerssfeeds', '0'),
(323, 'feedback_allowfullanonymous', '0'),
(324, 'forum_displaymode', '3'),
(325, 'forum_replytouser', '1'),
(326, 'forum_shortpost', '300'),
(327, 'forum_longpost', '600'),
(328, 'forum_manydiscussions', '100'),
(329, 'forum_maxbytes', '512000'),
(330, 'forum_maxattachments', '9'),
(331, 'forum_trackreadposts', '1'),
(332, 'forum_oldpostdays', '14'),
(333, 'forum_usermarksread', '0'),
(334, 'forum_cleanreadtime', '2'),
(335, 'digestmailtime', '17'),
(336, 'forum_enablerssfeeds', '0'),
(337, 'forum_enabletimedposts', '0'),
(338, 'glossary_entbypage', '10'),
(339, 'glossary_dupentries', '0'),
(340, 'glossary_allowcomments', '0'),
(341, 'glossary_linkbydefault', '1'),
(342, 'glossary_defaultapproval', '1'),
(343, 'glossary_enablerssfeeds', '0'),
(344, 'glossary_linkentries', '0'),
(345, 'glossary_casesensitive', '0'),
(346, 'glossary_fullmatch', '0'),
(347, 'lesson_slideshowwidth', '640'),
(348, 'lesson_slideshowheight', '480'),
(349, 'lesson_slideshowbgcolor', '#FFFFFF'),
(350, 'lesson_mediawidth', '640'),
(351, 'lesson_mediaheight', '480'),
(352, 'lesson_mediaclose', '0'),
(353, 'lesson_maxhighscores', '10'),
(354, 'lesson_maxanswers', '4'),
(355, 'lesson_defaultnextpage', '0'),
(356, 'block_course_list_adminview', 'all'),
(357, 'block_course_list_hideallcourseslink', '0'),
(358, 'block_online_users_timetosee', '5'),
(359, 'block_rss_client_num_entries', '5'),
(360, 'block_rss_client_timeout', '30'),
(361, 'block_tags_showcoursetags', '0'),
(362, 'jabberhost', ''),
(363, 'jabberserver', ''),
(364, 'jabberusername', ''),
(365, 'jabberpassword', ''),
(366, 'jabberport', '5222'),
(367, 'smtphosts', ''),
(368, 'smtpuser', ''),
(369, 'smtppass', ''),
(370, 'smtpmaxbulk', '1'),
(371, 'noreplyaddress', 'noreply@localhost'),
(372, 'sitemailcharset', '0'),
(373, 'allowusermailcharset', '0'),
(374, 'mailnewline', 'LF'),
(375, 'profileroles', '5,4,3'),
(376, 'defaultallowedmodules', ''),
(377, 'coursecontact', '3'),
(378, 'frontpage', '1'),
(379, 'frontpageloggedin', '1'),
(380, 'maxcategorydepth', '0'),
(381, 'commentsperpage', '15'),
(382, 'coursesperpage', '20'),
(383, 'defaultfrontpageroleid', '8'),
(384, 'supportname', 'Admin User'),
(385, 'supportemail', 'ankit@eneev.com'),
(386, 'registerauth', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` text,
  `oldvalue` text,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=738 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1364029015, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1364029015, NULL, 'usecomments', '1', NULL),
(3, 0, 1364029015, NULL, 'usetags', '1', NULL),
(4, 0, 1364029015, NULL, 'enablenotes', '1', NULL),
(5, 0, 1364029015, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1364029015, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1364029015, NULL, 'messaging', '1', NULL),
(8, 0, 1364029015, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1364029015, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1364029015, NULL, 'enablestats', '0', NULL),
(11, 0, 1364029015, NULL, 'enablerssfeeds', '0', NULL),
(12, 0, 1364029015, NULL, 'bloglevel', '4', NULL),
(13, 0, 1364029015, NULL, 'enablecompletion', '0', NULL),
(14, 0, 1364029015, NULL, 'enableavailability', '0', NULL),
(15, 0, 1364029015, NULL, 'enableplagiarism', '0', NULL),
(16, 0, 1364029015, NULL, 'autologinguests', '0', NULL),
(17, 0, 1364029015, NULL, 'hiddenuserfields', '', NULL),
(18, 0, 1364029015, NULL, 'showuseridentity', 'email', NULL),
(19, 0, 1364029015, NULL, 'enablegravatar', '0', NULL),
(20, 0, 1364029015, NULL, 'gravatardefaulturl', 'mm', NULL),
(21, 0, 1364029015, 'moodlecourse', 'format', 'weeks', NULL),
(22, 0, 1364029015, 'moodlecourse', 'maxsections', '52', NULL),
(23, 0, 1364029015, 'moodlecourse', 'numsections', '10', NULL),
(24, 0, 1364029015, 'moodlecourse', 'hiddensections', '0', NULL),
(25, 0, 1364029015, 'moodlecourse', 'newsitems', '5', NULL),
(26, 0, 1364029015, 'moodlecourse', 'showgrades', '1', NULL),
(27, 0, 1364029015, 'moodlecourse', 'showreports', '0', NULL),
(28, 0, 1364029015, 'moodlecourse', 'maxbytes', '83886080', NULL),
(29, 0, 1364029015, 'moodlecourse', 'groupmode', '0', NULL),
(30, 0, 1364029016, 'moodlecourse', 'groupmodeforce', '0', NULL),
(31, 0, 1364029016, 'moodlecourse', 'visible', '1', NULL),
(32, 0, 1364029016, 'moodlecourse', 'lang', '', NULL),
(33, 0, 1364029016, 'moodlecourse', 'enablecompletion', '0', NULL),
(34, 0, 1364029016, 'moodlecourse', 'completionstartonenrol', '0', NULL),
(35, 0, 1364029016, NULL, 'enablecourserequests', '0', NULL),
(36, 0, 1364029016, NULL, 'defaultrequestcategory', '1', NULL),
(37, 0, 1364029016, NULL, 'courserequestnotify', '', NULL),
(38, 0, 1364029016, 'backup', 'loglifetime', '30', NULL),
(39, 0, 1364029016, 'backup', 'backup_general_users', '1', NULL),
(40, 0, 1364029016, 'backup', 'backup_general_users_locked', '0', NULL),
(41, 0, 1364029016, 'backup', 'backup_general_anonymize', '0', NULL),
(42, 0, 1364029016, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(43, 0, 1364029016, 'backup', 'backup_general_role_assignments', '1', NULL),
(44, 0, 1364029016, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(45, 0, 1364029016, 'backup', 'backup_general_activities', '1', NULL),
(46, 0, 1364029016, 'backup', 'backup_general_activities_locked', '0', NULL),
(47, 0, 1364029016, 'backup', 'backup_general_blocks', '1', NULL),
(48, 0, 1364029016, 'backup', 'backup_general_blocks_locked', '0', NULL),
(49, 0, 1364029016, 'backup', 'backup_general_filters', '1', NULL),
(50, 0, 1364029016, 'backup', 'backup_general_filters_locked', '0', NULL),
(51, 0, 1364029016, 'backup', 'backup_general_comments', '1', NULL),
(52, 0, 1364029016, 'backup', 'backup_general_comments_locked', '0', NULL),
(53, 0, 1364029016, 'backup', 'backup_general_userscompletion', '1', NULL),
(54, 0, 1364029016, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(55, 0, 1364029016, 'backup', 'backup_general_logs', '0', NULL),
(56, 0, 1364029016, 'backup', 'backup_general_logs_locked', '0', NULL),
(57, 0, 1364029016, 'backup', 'backup_general_histories', '0', NULL),
(58, 0, 1364029016, 'backup', 'backup_general_histories_locked', '0', NULL),
(59, 0, 1364029016, 'backup', 'backup_auto_active', '0', NULL),
(60, 0, 1364029016, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(61, 0, 1364029016, 'backup', 'backup_auto_hour', '0', NULL),
(62, 0, 1364029016, 'backup', 'backup_auto_minute', '0', NULL),
(63, 0, 1364029016, 'backup', 'backup_auto_storage', '0', NULL),
(64, 0, 1364029016, 'backup', 'backup_auto_destination', '', NULL),
(65, 0, 1364029016, 'backup', 'backup_auto_keep', '1', NULL),
(66, 0, 1364029016, 'backup', 'backup_shortname', '0', NULL),
(67, 0, 1364029016, 'backup', 'backup_auto_users', '1', NULL),
(68, 0, 1364029016, 'backup', 'backup_auto_role_assignments', '1', NULL),
(69, 0, 1364029016, 'backup', 'backup_auto_activities', '1', NULL),
(70, 0, 1364029016, 'backup', 'backup_auto_blocks', '1', NULL),
(71, 0, 1364029016, 'backup', 'backup_auto_filters', '1', NULL),
(72, 0, 1364029016, 'backup', 'backup_auto_comments', '1', NULL),
(73, 0, 1364029016, 'backup', 'backup_auto_userscompletion', '1', NULL),
(74, 0, 1364029016, 'backup', 'backup_auto_logs', '0', NULL),
(75, 0, 1364029016, 'backup', 'backup_auto_histories', '0', NULL),
(76, 0, 1364029016, NULL, 'grade_profilereport', 'user', NULL),
(77, 0, 1364029016, NULL, 'grade_aggregationposition', '1', NULL),
(78, 0, 1364029016, NULL, 'grade_includescalesinaggregation', '1', NULL),
(79, 0, 1364029016, NULL, 'grade_hiddenasdate', '0', NULL),
(80, 0, 1364029016, NULL, 'gradepublishing', '0', NULL),
(81, 0, 1364029016, NULL, 'grade_export_displaytype', '1', NULL),
(82, 0, 1364029016, NULL, 'grade_export_decimalpoints', '2', NULL),
(83, 0, 1364029016, NULL, 'grade_navmethod', '0', NULL),
(84, 0, 1364029016, NULL, 'gradeexport', '', NULL),
(85, 0, 1364029016, NULL, 'unlimitedgrades', '0', NULL),
(86, 0, 1364029016, NULL, 'grade_hideforcedsettings', '1', NULL),
(87, 0, 1364029016, NULL, 'grade_aggregation', '11', NULL),
(88, 0, 1364029016, NULL, 'grade_aggregation_flag', '0', NULL),
(89, 0, 1364029016, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(90, 0, 1364029016, NULL, 'grade_aggregateonlygraded', '1', NULL),
(91, 0, 1364029016, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(92, 0, 1364029016, NULL, 'grade_aggregateoutcomes', '0', NULL),
(93, 0, 1364029016, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(94, 0, 1364029016, NULL, 'grade_aggregatesubcats', '0', NULL),
(95, 0, 1364029016, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(96, 0, 1364029016, NULL, 'grade_keephigh', '0', NULL),
(97, 0, 1364029016, NULL, 'grade_keephigh_flag', '3', NULL),
(98, 0, 1364029016, NULL, 'grade_droplow', '0', NULL),
(99, 0, 1364029016, NULL, 'grade_droplow_flag', '2', NULL),
(100, 0, 1364029016, NULL, 'grade_displaytype', '1', NULL),
(101, 0, 1364029016, NULL, 'grade_decimalpoints', '2', NULL),
(102, 0, 1364029016, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(103, 0, 1364029016, NULL, 'grade_report_studentsperpage', '100', NULL),
(104, 0, 1364029016, NULL, 'grade_report_quickgrading', '1', NULL),
(105, 0, 1364029016, NULL, 'grade_report_showquickfeedback', '0', NULL),
(106, 0, 1364029016, NULL, 'grade_report_fixedstudents', '0', NULL),
(107, 0, 1364029016, NULL, 'grade_report_meanselection', '1', NULL),
(108, 0, 1364029016, NULL, 'grade_report_enableajax', '0', NULL),
(109, 0, 1364029016, NULL, 'grade_report_showcalculations', '0', NULL),
(110, 0, 1364029016, NULL, 'grade_report_showeyecons', '0', NULL),
(111, 0, 1364029016, NULL, 'grade_report_showaverages', '1', NULL),
(112, 0, 1364029016, NULL, 'grade_report_showlocks', '0', NULL),
(113, 0, 1364029017, NULL, 'grade_report_showranges', '0', NULL),
(114, 0, 1364029017, NULL, 'grade_report_showanalysisicon', '1', NULL),
(115, 0, 1364029017, NULL, 'grade_report_showuserimage', '1', NULL),
(116, 0, 1364029017, NULL, 'grade_report_showactivityicons', '1', NULL),
(117, 0, 1364029017, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(118, 0, 1364029017, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(119, 0, 1364029017, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(120, 0, 1364029017, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(121, 0, 1364029017, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(122, 0, 1364029017, NULL, 'grade_report_overview_showrank', '0', NULL),
(123, 0, 1364029017, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(124, 0, 1364029017, NULL, 'grade_report_user_showrank', '0', NULL),
(125, 0, 1364029017, NULL, 'grade_report_user_showpercentage', '1', NULL),
(126, 0, 1364029017, NULL, 'grade_report_user_showgrade', '1', NULL),
(127, 0, 1364029017, NULL, 'grade_report_user_showfeedback', '1', NULL),
(128, 0, 1364029017, NULL, 'grade_report_user_showrange', '1', NULL),
(129, 0, 1364029017, NULL, 'grade_report_user_showweight', '0', NULL),
(130, 0, 1364029017, NULL, 'grade_report_user_showaverage', '0', NULL),
(131, 0, 1364029017, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(132, 0, 1364029017, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(133, 0, 1364029017, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(134, 0, 1364029017, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(135, 0, 1364029017, NULL, 'timezone', '99', NULL),
(136, 0, 1364029017, NULL, 'forcetimezone', '99', NULL),
(137, 0, 1364029017, NULL, 'country', '0', NULL),
(138, 0, 1364029017, NULL, 'defaultcity', '', NULL),
(139, 0, 1364029017, NULL, 'geoipfile', '/home/ankit/Documents/moodledata/geoip/GeoLiteCity.dat', NULL),
(140, 0, 1364029017, NULL, 'googlemapkey', '', NULL),
(141, 0, 1364029017, NULL, 'allcountrycodes', '', NULL),
(142, 0, 1364029017, NULL, 'autolang', '1', NULL),
(143, 0, 1364029017, NULL, 'lang', 'en', NULL),
(144, 0, 1364029017, NULL, 'langmenu', '1', NULL),
(145, 0, 1364029017, NULL, 'langlist', '', NULL),
(146, 0, 1364029017, NULL, 'langcache', '1', NULL),
(147, 0, 1364029017, NULL, 'langstringcache', '1', NULL),
(148, 0, 1364029017, NULL, 'locale', '', NULL),
(149, 0, 1364029017, NULL, 'latinexcelexport', '0', NULL),
(150, 0, 1364029017, NULL, 'registerauth', '', NULL),
(151, 0, 1364029017, NULL, 'authpreventaccountcreation', '0', NULL),
(152, 0, 1364029017, NULL, 'loginpageautofocus', '0', NULL),
(153, 0, 1364029017, NULL, 'guestloginbutton', '1', NULL),
(154, 0, 1364029017, NULL, 'alternateloginurl', '', NULL),
(155, 0, 1364029017, NULL, 'forgottenpasswordurl', '', NULL),
(156, 0, 1364029017, NULL, 'auth_instructions', '', NULL),
(157, 0, 1364029017, NULL, 'allowemailaddresses', '', NULL),
(158, 0, 1364029017, NULL, 'denyemailaddresses', '', NULL),
(159, 0, 1364029017, NULL, 'verifychangedemail', '1', NULL),
(160, 0, 1364029017, NULL, 'recaptchapublickey', '', NULL),
(161, 0, 1364029017, NULL, 'recaptchaprivatekey', '', NULL),
(162, 0, 1364029017, 'enrol_database', 'dbtype', '', NULL),
(163, 0, 1364029017, 'enrol_database', 'dbhost', 'localhost', NULL),
(164, 0, 1364029017, 'enrol_database', 'dbuser', '', NULL),
(165, 0, 1364029017, 'enrol_database', 'dbpass', '', NULL),
(166, 0, 1364029017, 'enrol_database', 'dbname', '', NULL),
(167, 0, 1364029017, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(168, 0, 1364029017, 'enrol_database', 'dbsetupsql', '', NULL),
(169, 0, 1364029017, 'enrol_database', 'dbsybasequoting', '0', NULL),
(170, 0, 1364029017, 'enrol_database', 'debugdb', '0', NULL),
(171, 0, 1364029017, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(172, 0, 1364029017, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(173, 0, 1364029017, 'enrol_database', 'localrolefield', 'shortname', NULL),
(174, 0, 1364029017, 'enrol_database', 'remoteenroltable', '', NULL),
(175, 0, 1364029017, 'enrol_database', 'remotecoursefield', '', NULL),
(176, 0, 1364029017, 'enrol_database', 'remoteuserfield', '', NULL),
(177, 0, 1364029017, 'enrol_database', 'remoterolefield', '', NULL),
(178, 0, 1364029017, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(179, 0, 1364029017, 'enrol_database', 'unenrolaction', '0', NULL),
(180, 0, 1364029017, 'enrol_database', 'newcoursetable', '', NULL),
(181, 0, 1364029017, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(182, 0, 1364029017, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(183, 0, 1364029017, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(184, 0, 1364029017, 'enrol_database', 'newcoursecategory', '', NULL),
(185, 0, 1364029017, 'enrol_database', 'templatecourse', '', NULL),
(186, 0, 1364029017, 'enrol_flatfile', 'location', '', NULL),
(187, 0, 1364029017, 'enrol_flatfile', 'mailstudents', '0', NULL),
(188, 0, 1364029017, 'enrol_flatfile', 'mailteachers', '0', NULL),
(189, 0, 1364029017, 'enrol_flatfile', 'mailadmins', '0', NULL),
(190, 0, 1364029017, 'enrol_guest', 'requirepassword', '0', NULL),
(191, 0, 1364029017, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(192, 0, 1364029017, 'enrol_guest', 'showhint', '0', NULL),
(193, 0, 1364029017, 'enrol_guest', 'defaultenrol', '1', NULL),
(194, 0, 1364029017, 'enrol_guest', 'status', '1', NULL),
(195, 0, 1364029017, 'enrol_guest', 'status_adv', '0', NULL),
(196, 0, 1364029017, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(197, 0, 1364029018, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(198, 0, 1364029018, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(199, 0, 1364029018, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(200, 0, 1364029018, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(201, 0, 1364029018, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(202, 0, 1364029018, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(203, 0, 1364029018, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(204, 0, 1364029018, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(205, 0, 1364029018, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(206, 0, 1364029018, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(207, 0, 1364029018, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(208, 0, 1364029018, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(209, 0, 1364029018, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(210, 0, 1364029018, 'enrol_manual', 'defaultenrol', '1', NULL),
(211, 0, 1364029018, 'enrol_manual', 'status', '0', NULL),
(212, 0, 1364029018, 'enrol_manual', 'enrolperiod', '0', NULL),
(213, 0, 1364029018, 'enrol_paypal', 'paypalbusiness', '', NULL),
(214, 0, 1364029018, 'enrol_paypal', 'mailstudents', '0', NULL),
(215, 0, 1364029018, 'enrol_paypal', 'mailteachers', '0', NULL),
(216, 0, 1364029018, 'enrol_paypal', 'mailadmins', '0', NULL),
(217, 0, 1364029018, 'enrol_paypal', 'status', '1', NULL),
(218, 0, 1364029018, 'enrol_paypal', 'cost', '0', NULL),
(219, 0, 1364029018, 'enrol_paypal', 'currency', 'USD', NULL),
(220, 0, 1364029018, 'enrol_paypal', 'enrolperiod', '0', NULL),
(221, 0, 1364029018, 'enrol_self', 'requirepassword', '0', NULL),
(222, 0, 1364029018, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(223, 0, 1364029018, 'enrol_self', 'showhint', '0', NULL),
(224, 0, 1364029018, 'enrol_self', 'defaultenrol', '1', NULL),
(225, 0, 1364029018, 'enrol_self', 'status', '1', NULL),
(226, 0, 1364029018, 'enrol_self', 'groupkey', '0', NULL),
(227, 0, 1364029018, 'enrol_self', 'enrolperiod', '0', NULL),
(228, 0, 1364029018, 'enrol_self', 'longtimenosee', '0', NULL),
(229, 0, 1364029018, 'enrol_self', 'maxenrolled', '0', NULL),
(230, 0, 1364029018, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(231, 0, 1364029018, 'editor_tinymce', 'spellengine', 'GoogleSpell', NULL),
(232, 0, 1364029018, 'editor_tinymce', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(233, 0, 1364029018, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(234, 0, 1364029018, NULL, 'cachetext', '60', NULL),
(235, 0, 1364029018, NULL, 'filteruploadedfiles', '0', NULL),
(236, 0, 1364029018, NULL, 'filtermatchoneperpage', '0', NULL),
(237, 0, 1364029018, NULL, 'filtermatchonepertext', '0', NULL),
(238, 0, 1364029018, 'filter_urltolink', 'formats', '0', NULL),
(239, 0, 1364029018, 'filter_urltolink', 'embedimages', '1', NULL),
(240, 0, 1364029018, 'filter_emoticon', 'formats', '1,4,0', NULL),
(241, 0, 1364029018, NULL, 'filter_multilang_force_old', '0', NULL),
(242, 0, 1364029018, NULL, 'filter_mediaplugin_enable_youtube', '1', NULL),
(243, 0, 1364029018, NULL, 'filter_mediaplugin_enable_vimeo', '0', NULL),
(244, 0, 1364029018, NULL, 'filter_mediaplugin_enable_mp3', '1', NULL),
(245, 0, 1364029018, NULL, 'filter_mediaplugin_enable_flv', '1', NULL),
(246, 0, 1364029018, NULL, 'filter_mediaplugin_enable_swf', '1', NULL),
(247, 0, 1364029018, NULL, 'filter_mediaplugin_enable_html5audio', '0', NULL),
(248, 0, 1364029018, NULL, 'filter_mediaplugin_enable_html5video', '0', NULL),
(249, 0, 1364029018, NULL, 'filter_mediaplugin_enable_qt', '1', NULL),
(250, 0, 1364029018, NULL, 'filter_mediaplugin_enable_wmp', '1', NULL),
(251, 0, 1364029018, NULL, 'filter_mediaplugin_enable_rm', '1', NULL),
(252, 0, 1364029018, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(253, 0, 1364029018, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(254, 0, 1364029018, NULL, 'filter_tex_density', '120', NULL),
(255, 0, 1364029018, NULL, 'filter_tex_pathlatex', '/usr/bin/latex', NULL),
(256, 0, 1364029018, NULL, 'filter_tex_pathdvips', '/usr/bin/dvips', NULL),
(257, 0, 1364029018, NULL, 'filter_tex_pathconvert', '/usr/bin/convert', NULL),
(258, 0, 1364029018, NULL, 'filter_tex_convertformat', 'gif', NULL),
(259, 0, 1364029018, NULL, 'filter_censor_badwords', '', NULL),
(260, 0, 1364029018, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(261, 0, 1364029018, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(262, 0, 1364029018, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(263, 0, 1364029018, NULL, 'portfolio_high_db_threshold', '50', NULL),
(264, 0, 1364029018, NULL, 'repositorycacheexpire', '120', NULL),
(265, 0, 1364029018, NULL, 'repositoryallowexternallinks', '1', NULL),
(266, 0, 1364029018, NULL, 'legacyfilesinnewcourses', '0', NULL),
(267, 0, 1364029018, NULL, 'enablewsdocumentation', '0', NULL),
(268, 0, 1364029018, NULL, 'allowbeforeblock', '0', NULL),
(269, 0, 1364029018, NULL, 'allowedip', '', NULL),
(270, 0, 1364029018, NULL, 'blockedip', '', NULL),
(271, 0, 1364029018, NULL, 'protectusernames', '1', NULL),
(272, 0, 1364029019, NULL, 'forcelogin', '0', NULL),
(273, 0, 1364029019, NULL, 'forceloginforprofiles', '1', NULL),
(274, 0, 1364029019, NULL, 'forceloginforprofileimage', '0', NULL),
(275, 0, 1364029019, NULL, 'opentogoogle', '0', NULL),
(276, 0, 1364029019, NULL, 'maxbytes', '0', NULL),
(277, 0, 1364029019, NULL, 'userquota', '104857600', NULL),
(278, 0, 1364029019, NULL, 'allowobjectembed', '0', NULL),
(279, 0, 1364029019, NULL, 'enabletrusttext', '0', NULL),
(280, 0, 1364029019, NULL, 'maxeditingtime', '1800', NULL),
(281, 0, 1364029019, NULL, 'fullnamedisplay', 'language', NULL),
(282, 0, 1364029019, NULL, 'extendedusernamechars', '0', NULL),
(283, 0, 1364029019, NULL, 'sitepolicy', '', NULL),
(284, 0, 1364029019, NULL, 'sitepolicyguest', '', NULL),
(285, 0, 1364029019, NULL, 'keeptagnamecase', '1', NULL),
(286, 0, 1364029019, NULL, 'profilesforenrolledusersonly', '1', NULL),
(287, 0, 1364029019, NULL, 'cronclionly', '0', NULL),
(288, 0, 1364029019, NULL, 'cronremotepassword', '', NULL),
(289, 0, 1364029019, NULL, 'passwordpolicy', '1', NULL),
(290, 0, 1364029019, NULL, 'minpasswordlength', '8', NULL),
(291, 0, 1364029019, NULL, 'minpassworddigits', '1', NULL),
(292, 0, 1364029019, NULL, 'minpasswordlower', '1', NULL),
(293, 0, 1364029019, NULL, 'minpasswordupper', '1', NULL),
(294, 0, 1364029019, NULL, 'minpasswordnonalphanum', '1', NULL),
(295, 0, 1364029019, NULL, 'maxconsecutiveidentchars', '0', NULL),
(296, 0, 1364029019, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(297, 0, 1364029019, NULL, 'disableuserimages', '0', NULL),
(298, 0, 1364029019, NULL, 'emailchangeconfirmation', '1', NULL),
(299, 0, 1364029019, NULL, 'rememberusername', '2', NULL),
(300, 0, 1364029019, NULL, 'strictformsrequired', '0', NULL),
(301, 0, 1364029019, NULL, 'loginhttps', '0', NULL),
(302, 0, 1364029019, NULL, 'cookiesecure', '0', NULL),
(303, 0, 1364029019, NULL, 'cookiehttponly', '0', NULL),
(304, 0, 1364029019, NULL, 'allowframembedding', '0', NULL),
(305, 0, 1364029019, NULL, 'loginpasswordautocomplete', '0', NULL),
(306, 0, 1364029019, NULL, 'restrictmodulesfor', 'none', NULL),
(307, 0, 1364029019, NULL, 'restrictbydefault', '0', NULL),
(308, 0, 1364029019, NULL, 'displayloginfailures', '', NULL),
(309, 0, 1364029019, NULL, 'notifyloginfailures', '', NULL),
(310, 0, 1364029019, NULL, 'notifyloginthreshold', '10', NULL),
(311, 0, 1364029019, NULL, 'runclamonupload', '0', NULL),
(312, 0, 1364029019, NULL, 'pathtoclam', '', NULL),
(313, 0, 1364029019, NULL, 'quarantinedir', '', NULL),
(314, 0, 1364029019, NULL, 'clamfailureonupload', 'donothing', NULL),
(315, 0, 1364029019, NULL, 'themelist', '', NULL),
(316, 0, 1364029019, NULL, 'themedesignermode', '0', NULL),
(317, 0, 1364029019, NULL, 'allowuserthemes', '0', NULL),
(318, 0, 1364029019, NULL, 'allowcoursethemes', '0', NULL),
(319, 0, 1364029019, NULL, 'allowcategorythemes', '0', NULL),
(320, 0, 1364029019, NULL, 'allowthemechangeonurl', '0', NULL),
(321, 0, 1364029019, NULL, 'allowuserblockhiding', '1', NULL),
(322, 0, 1364029019, NULL, 'allowblockstodock', '1', NULL),
(323, 0, 1364029019, NULL, 'custommenuitems', '', NULL),
(324, 0, 1364029019, NULL, 'enabledevicedetection', '1', NULL),
(325, 0, 1364029019, NULL, 'devicedetectregex', '[]', NULL),
(326, 0, 1364029019, 'theme_afterburner', 'logo', '', NULL),
(327, 0, 1364029019, 'theme_afterburner', 'footnote', '', NULL),
(328, 0, 1364029019, 'theme_afterburner', 'customcss', '', NULL),
(329, 0, 1364029019, 'theme_arialist', 'logo', '', NULL),
(330, 0, 1364029019, 'theme_arialist', 'tagline', '', NULL),
(331, 0, 1364029019, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(332, 0, 1364029019, 'theme_arialist', 'regionwidth', '250', NULL),
(333, 0, 1364029019, 'theme_arialist', 'customcss', '', NULL),
(334, 0, 1364029019, 'theme_brick', 'logo', '', NULL),
(335, 0, 1364029019, 'theme_brick', 'linkcolor', '#06365b', NULL),
(336, 0, 1364029019, 'theme_brick', 'linkhover', '#5487ad', NULL),
(337, 0, 1364029019, 'theme_brick', 'maincolor', '#8e2800', NULL),
(338, 0, 1364029019, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(339, 0, 1364029019, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(340, 0, 1364029019, 'theme_formal_white', 'fontsizereference', '13', NULL),
(341, 0, 1364029019, 'theme_formal_white', 'noframe', '0', NULL),
(342, 0, 1364029019, 'theme_formal_white', 'displaylogo', '1', NULL),
(343, 0, 1364029019, 'theme_formal_white', 'logo', '', NULL),
(344, 0, 1364029019, 'theme_formal_white', 'frontpagelogo', '', NULL),
(345, 0, 1364029019, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(346, 0, 1364029019, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(347, 0, 1364029019, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(348, 0, 1364029019, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(349, 0, 1364029019, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(350, 0, 1364029019, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(351, 0, 1364029019, 'theme_formal_white', 'footnote', '', NULL),
(352, 0, 1364029019, 'theme_formal_white', 'customcss', '', NULL),
(353, 0, 1364029019, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(354, 0, 1364029019, 'theme_fusion', 'tagline', '', NULL),
(355, 0, 1364029019, 'theme_fusion', 'footertext', '', NULL),
(356, 0, 1364029019, 'theme_fusion', 'customcss', '', NULL),
(357, 0, 1364029019, 'theme_magazine', 'background', '', NULL),
(358, 0, 1364029019, 'theme_magazine', 'logo', '', NULL),
(359, 0, 1364029019, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(360, 0, 1364029019, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(361, 0, 1364029019, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(362, 0, 1364029019, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(363, 0, 1364029019, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(364, 0, 1364029020, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(365, 0, 1364029020, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(366, 0, 1364029020, 'theme_mymobile', 'colourswatch', 'light', NULL),
(367, 0, 1364029020, 'theme_mymobile', 'showmobileintro', '', NULL),
(368, 0, 1364029020, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(369, 0, 1364029020, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(370, 0, 1364029020, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(371, 0, 1364029020, 'theme_nimble', 'tagline', '', NULL),
(372, 0, 1364029020, 'theme_nimble', 'footerline', '', NULL),
(373, 0, 1364029020, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(374, 0, 1364029020, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(375, 0, 1364029020, 'theme_nimble', 'linkhover', '#222222', NULL),
(376, 0, 1364029020, 'theme_nonzero', 'regionprewidth', '200', NULL),
(377, 0, 1364029020, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(378, 0, 1364029020, 'theme_nonzero', 'customcss', '', NULL),
(379, 0, 1364029020, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(380, 0, 1364029020, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(381, 0, 1364029020, 'theme_overlay', 'footertext', '', NULL),
(382, 0, 1364029020, 'theme_overlay', 'customcss', '', NULL),
(383, 0, 1364029020, 'theme_sky_high', 'logo', '', NULL),
(384, 0, 1364029020, 'theme_sky_high', 'regionwidth', '240', NULL),
(385, 0, 1364029020, 'theme_sky_high', 'footnote', '', NULL),
(386, 0, 1364029020, 'theme_sky_high', 'customcss', '', NULL),
(387, 0, 1364029020, 'theme_splash', 'logo', '', NULL),
(388, 0, 1364029020, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(389, 0, 1364029020, 'theme_splash', 'hide_tagline', '0', NULL),
(390, 0, 1364029020, 'theme_splash', 'footnote', '', NULL),
(391, 0, 1364029020, 'theme_splash', 'customcss', '', NULL),
(392, 0, 1364029020, NULL, 'calendar_adminseesall', '0', NULL),
(393, 0, 1364029020, NULL, 'calendar_site_timeformat', '0', NULL),
(394, 0, 1364029020, NULL, 'calendar_startwday', '0', NULL),
(395, 0, 1364029020, NULL, 'calendar_weekend', '65', NULL),
(396, 0, 1364029020, NULL, 'calendar_lookahead', '21', NULL),
(397, 0, 1364029020, NULL, 'calendar_maxevents', '10', NULL),
(398, 0, 1364029020, NULL, 'enablecalendarexport', '1', NULL),
(399, 0, 1364029020, NULL, 'calendar_exportsalt', 'GZrSTKoHj9O06qK6Qj88u7twCqhc2u1v5UZLjqRG9X5VzGjmg7ouK9FGkO5H', NULL),
(400, 0, 1364029020, NULL, 'useblogassociations', '1', NULL),
(401, 0, 1364029020, NULL, 'useexternalblogs', '1', NULL),
(402, 0, 1364029020, NULL, 'externalblogcrontime', '86400', NULL),
(403, 0, 1364029020, NULL, 'maxexternalblogsperuser', '1', NULL),
(404, 0, 1364029020, NULL, 'blogusecomments', '1', NULL),
(405, 0, 1364029020, NULL, 'blogshowcommentscount', '1', NULL),
(406, 0, 1364029020, NULL, 'defaulthomepage', '0', NULL),
(407, 0, 1364029020, NULL, 'navshowcategories', '1', NULL),
(408, 0, 1364029020, NULL, 'navshowallcourses', '0', NULL),
(409, 0, 1364029020, NULL, 'navcourselimit', '20', NULL),
(410, 0, 1364029020, NULL, 'navlinkcoursesections', '0', NULL),
(411, 0, 1364029020, NULL, 'usesitenameforsitepages', '0', NULL),
(412, 0, 1364029020, NULL, 'navadduserpostslinks', '1', NULL),
(413, 0, 1364029020, NULL, 'formatstringstriptags', '1', NULL),
(414, 0, 1364029020, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(415, 0, 1364029020, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(416, 0, 1364029020, NULL, 'doctonewwindow', '0', NULL),
(417, 0, 1364029020, NULL, 'courselistshortnames', '0', NULL),
(418, 0, 1364029020, NULL, 'enableajax', '1', NULL),
(419, 0, 1364029020, NULL, 'useexternalyui', '0', NULL),
(420, 0, 1364029020, NULL, 'yuicomboloading', '1', NULL),
(421, 0, 1364029020, NULL, 'cachejs', '1', NULL),
(422, 0, 1364029020, NULL, 'enablecourseajax', '1', NULL),
(423, 0, 1364029020, NULL, 'additionalhtmlhead', '', NULL),
(424, 0, 1364029020, NULL, 'additionalhtmltopofbody', '', NULL),
(425, 0, 1364029020, NULL, 'additionalhtmlfooter', '', NULL),
(426, 0, 1364029020, NULL, 'gdversion', '2', NULL),
(427, 0, 1364029020, NULL, 'pathtodu', '', NULL),
(428, 0, 1364029020, NULL, 'aspellpath', '', NULL),
(429, 0, 1364029020, NULL, 'pathtodot', '', NULL),
(430, 0, 1364029020, NULL, 'supportpage', '', NULL),
(431, 0, 1364029020, NULL, 'dbsessions', '1', NULL),
(432, 0, 1364029020, NULL, 'sessioncookie', '', NULL),
(433, 0, 1364029020, NULL, 'sessioncookiepath', '', NULL),
(434, 0, 1364029020, NULL, 'sessioncookiedomain', '', NULL),
(435, 0, 1364029020, NULL, 'statsfirstrun', 'none', NULL),
(436, 0, 1364029020, NULL, 'statsmaxruntime', '0', NULL),
(437, 0, 1364029020, NULL, 'statsruntimedays', '31', NULL),
(438, 0, 1364029020, NULL, 'statsruntimestarthour', '0', NULL),
(439, 0, 1364029020, NULL, 'statsruntimestartminute', '0', NULL),
(440, 0, 1364029020, NULL, 'statsuserthreshold', '0', NULL),
(441, 0, 1364029020, NULL, 'slasharguments', '1', NULL),
(442, 0, 1364029020, NULL, 'getremoteaddrconf', '0', NULL),
(443, 0, 1364029020, NULL, 'proxyhost', '', NULL),
(444, 0, 1364029020, NULL, 'proxyport', '0', NULL),
(445, 0, 1364029020, NULL, 'proxytype', 'HTTP', NULL),
(446, 0, 1364029020, NULL, 'proxyuser', '', NULL),
(447, 0, 1364029020, NULL, 'proxypassword', '', NULL),
(448, 0, 1364029020, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(449, 0, 1364029020, NULL, 'maintenance_enabled', '0', NULL),
(450, 0, 1364029020, NULL, 'maintenance_message', '', NULL),
(451, 0, 1364029020, NULL, 'deleteunconfirmed', '168', NULL),
(452, 0, 1364029020, NULL, 'deleteincompleteusers', '0', NULL),
(453, 0, 1364029020, NULL, 'logguests', '1', NULL),
(454, 0, 1364029020, NULL, 'loglifetime', '0', NULL),
(455, 0, 1364029020, NULL, 'disablegradehistory', '0', NULL),
(456, 0, 1364029020, NULL, 'gradehistorylifetime', '0', NULL),
(457, 0, 1364029020, NULL, 'numcoursesincombo', '500', NULL),
(458, 0, 1364029020, NULL, 'extramemorylimit', '512M', NULL),
(459, 0, 1364029020, NULL, 'curlcache', '120', NULL),
(460, 0, 1364029020, NULL, 'curltimeoutkbitrate', '56', NULL),
(461, 0, 1364029020, NULL, 'enablesafebrowserintegration', '0', NULL),
(462, 0, 1364029020, NULL, 'enablegroupmembersonly', '0', NULL),
(463, 0, 1364029020, NULL, 'debug', '0', NULL),
(464, 0, 1364029021, NULL, 'debugdisplay', '0', NULL),
(465, 0, 1364029021, NULL, 'xmlstrictheaders', '0', NULL),
(466, 0, 1364029021, NULL, 'debugsmtp', '0', NULL),
(467, 0, 1364029021, NULL, 'perfdebug', '7', NULL),
(468, 0, 1364029021, NULL, 'debugstringids', '0', NULL),
(469, 0, 1364029021, NULL, 'debugvalidators', '0', NULL),
(470, 0, 1364029021, NULL, 'debugpageinfo', '0', NULL),
(471, 2, 1364029234, NULL, 'notloggedinroleid', '6', NULL),
(472, 2, 1364029234, NULL, 'guestroleid', '6', NULL),
(473, 2, 1364029234, NULL, 'defaultuserroleid', '7', NULL),
(474, 2, 1364029234, NULL, 'creatornewroleid', '3', NULL),
(475, 2, 1364029234, NULL, 'restorernewroleid', '3', NULL),
(476, 2, 1364029234, NULL, 'gradebookroles', '5', NULL),
(477, 2, 1364029234, NULL, 'assignment_maxbytes', '1048576', NULL),
(478, 2, 1364029234, NULL, 'assignment_itemstocount', '1', NULL),
(479, 2, 1364029234, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(480, 2, 1364029234, NULL, 'chat_method', 'ajax', NULL),
(481, 2, 1364029234, NULL, 'chat_refresh_userlist', '10', NULL),
(482, 2, 1364029234, NULL, 'chat_old_ping', '35', NULL),
(483, 2, 1364029234, NULL, 'chat_refresh_room', '5', NULL),
(484, 2, 1364029234, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(485, 2, 1364029234, NULL, 'chat_serverhost', 'localhost', NULL),
(486, 2, 1364029234, NULL, 'chat_serverip', '127.0.0.1', NULL),
(487, 2, 1364029234, NULL, 'chat_serverport', '9111', NULL),
(488, 2, 1364029234, NULL, 'chat_servermax', '100', NULL),
(489, 2, 1364029234, NULL, 'data_enablerssfeeds', '0', NULL),
(490, 2, 1364029234, NULL, 'feedback_allowfullanonymous', '0', NULL),
(491, 2, 1364029234, 'folder', 'requiremodintro', '1', NULL),
(492, 2, 1364029234, NULL, 'forum_displaymode', '3', NULL),
(493, 2, 1364029234, NULL, 'forum_replytouser', '1', NULL),
(494, 2, 1364029234, NULL, 'forum_shortpost', '300', NULL),
(495, 2, 1364029234, NULL, 'forum_longpost', '600', NULL),
(496, 2, 1364029234, NULL, 'forum_manydiscussions', '100', NULL),
(497, 2, 1364029234, NULL, 'forum_maxbytes', '512000', NULL),
(498, 2, 1364029234, NULL, 'forum_maxattachments', '9', NULL),
(499, 2, 1364029234, NULL, 'forum_trackreadposts', '1', NULL),
(500, 2, 1364029234, NULL, 'forum_oldpostdays', '14', NULL),
(501, 2, 1364029234, NULL, 'forum_usermarksread', '0', NULL),
(502, 2, 1364029234, NULL, 'forum_cleanreadtime', '2', NULL),
(503, 2, 1364029234, NULL, 'digestmailtime', '17', NULL),
(504, 2, 1364029234, NULL, 'forum_enablerssfeeds', '0', NULL),
(505, 2, 1364029234, NULL, 'forum_enabletimedposts', '0', NULL),
(506, 2, 1364029234, NULL, 'glossary_entbypage', '10', NULL),
(507, 2, 1364029234, NULL, 'glossary_dupentries', '0', NULL),
(508, 2, 1364029234, NULL, 'glossary_allowcomments', '0', NULL),
(509, 2, 1364029234, NULL, 'glossary_linkbydefault', '1', NULL),
(510, 2, 1364029234, NULL, 'glossary_defaultapproval', '1', NULL),
(511, 2, 1364029234, NULL, 'glossary_enablerssfeeds', '0', NULL),
(512, 2, 1364029234, NULL, 'glossary_linkentries', '0', NULL),
(513, 2, 1364029234, NULL, 'glossary_casesensitive', '0', NULL),
(514, 2, 1364029234, NULL, 'glossary_fullmatch', '0', NULL),
(515, 2, 1364029234, 'imscp', 'requiremodintro', '1', NULL),
(516, 2, 1364029234, 'imscp', 'keepold', '1', NULL),
(517, 2, 1364029234, 'imscp', 'keepold_adv', '0', NULL),
(518, 2, 1364029235, NULL, 'lesson_slideshowwidth', '640', NULL),
(519, 2, 1364029235, NULL, 'lesson_slideshowheight', '480', NULL),
(520, 2, 1364029235, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(521, 2, 1364029235, NULL, 'lesson_mediawidth', '640', NULL),
(522, 2, 1364029235, NULL, 'lesson_mediaheight', '480', NULL),
(523, 2, 1364029235, NULL, 'lesson_mediaclose', '0', NULL),
(524, 2, 1364029235, NULL, 'lesson_maxhighscores', '10', NULL),
(525, 2, 1364029235, NULL, 'lesson_maxanswers', '4', NULL),
(526, 2, 1364029235, NULL, 'lesson_defaultnextpage', '0', NULL),
(527, 2, 1364029235, 'page', 'requiremodintro', '1', NULL),
(528, 2, 1364029235, 'page', 'displayoptions', '5', NULL),
(529, 2, 1364029235, 'page', 'printheading', '1', NULL),
(530, 2, 1364029235, 'page', 'printheading_adv', '0', NULL),
(531, 2, 1364029235, 'page', 'printintro', '0', NULL),
(532, 2, 1364029235, 'page', 'printintro_adv', '0', NULL),
(533, 2, 1364029235, 'page', 'display', '5', NULL),
(534, 2, 1364029235, 'page', 'display_adv', '1', NULL),
(535, 2, 1364029235, 'page', 'popupwidth', '620', NULL),
(536, 2, 1364029235, 'page', 'popupwidth_adv', '1', NULL),
(537, 2, 1364029235, 'page', 'popupheight', '450', NULL),
(538, 2, 1364029235, 'page', 'popupheight_adv', '1', NULL),
(539, 2, 1364029235, 'quiz', 'timelimit', '0', NULL),
(540, 2, 1364029235, 'quiz', 'timelimit_adv', '0', NULL),
(541, 2, 1364029235, 'quiz', 'attempts', '0', NULL),
(542, 2, 1364029235, 'quiz', 'attempts_adv', '0', NULL),
(543, 2, 1364029235, 'quiz', 'grademethod', '1', NULL),
(544, 2, 1364029235, 'quiz', 'grademethod_adv', '0', NULL),
(545, 2, 1364029235, 'quiz', 'maximumgrade', '10', NULL),
(546, 2, 1364029235, 'quiz', 'shufflequestions', '0', NULL),
(547, 2, 1364029235, 'quiz', 'shufflequestions_adv', '0', NULL),
(548, 2, 1364029235, 'quiz', 'questionsperpage', '1', NULL),
(549, 2, 1364029235, 'quiz', 'questionsperpage_adv', '0', NULL),
(550, 2, 1364029235, 'quiz', 'shuffleanswers', '1', NULL),
(551, 2, 1364029235, 'quiz', 'shuffleanswers_adv', '0', NULL),
(552, 2, 1364029235, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(553, 2, 1364029235, 'quiz', 'attemptonlast', '0', NULL),
(554, 2, 1364029235, 'quiz', 'attemptonlast_adv', '1', NULL),
(555, 2, 1364029235, 'quiz', 'reviewattempt', '69904', NULL),
(556, 2, 1364029235, 'quiz', 'reviewcorrectness', '69904', NULL),
(557, 2, 1364029235, 'quiz', 'reviewmarks', '69904', NULL),
(558, 2, 1364029235, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(559, 2, 1364029235, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(560, 2, 1364029235, 'quiz', 'reviewrightanswer', '69904', NULL),
(561, 2, 1364029235, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(562, 2, 1364029235, 'quiz', 'showuserpicture', '0', NULL),
(563, 2, 1364029235, 'quiz', 'showuserpicture_adv', '0', NULL),
(564, 2, 1364029235, 'quiz', 'decimalpoints', '2', NULL),
(565, 2, 1364029235, 'quiz', 'decimalpoints_adv', '0', NULL),
(566, 2, 1364029235, 'quiz', 'questiondecimalpoints', '-1', NULL),
(567, 2, 1364029235, 'quiz', 'questiondecimalpoints_adv', '0', NULL),
(568, 2, 1364029235, 'quiz', 'showblocks', '0', NULL),
(569, 2, 1364029235, 'quiz', 'showblocks_adv', '1', NULL),
(570, 2, 1364029235, 'quiz', 'password', '', NULL),
(571, 2, 1364029235, 'quiz', 'password_adv', '0', NULL),
(572, 2, 1364029235, 'quiz', 'subnet', '', NULL),
(573, 2, 1364029235, 'quiz', 'subnet_adv', '0', NULL),
(574, 2, 1364029235, 'quiz', 'delay1', '0', NULL),
(575, 2, 1364029235, 'quiz', 'delay1_adv', '0', NULL),
(576, 2, 1364029235, 'quiz', 'delay2', '0', NULL),
(577, 2, 1364029235, 'quiz', 'delay2_adv', '0', NULL),
(578, 2, 1364029235, 'quiz', 'browsersecurity', '-', NULL),
(579, 2, 1364029235, 'quiz', 'browsersecurity_adv', '1', NULL),
(580, 2, 1364029235, 'resource', 'framesize', '130', NULL),
(581, 2, 1364029235, 'resource', 'requiremodintro', '1', NULL),
(582, 2, 1364029235, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(583, 2, 1364029235, 'resource', 'printheading', '0', NULL),
(584, 2, 1364029235, 'resource', 'printheading_adv', '0', NULL),
(585, 2, 1364029235, 'resource', 'printintro', '1', NULL),
(586, 2, 1364029235, 'resource', 'printintro_adv', '0', NULL),
(587, 2, 1364029235, 'resource', 'display', '0', NULL),
(588, 2, 1364029235, 'resource', 'display_adv', '0', NULL),
(589, 2, 1364029235, 'resource', 'popupwidth', '620', NULL),
(590, 2, 1364029235, 'resource', 'popupwidth_adv', '1', NULL),
(591, 2, 1364029235, 'resource', 'popupheight', '450', NULL),
(592, 2, 1364029235, 'resource', 'popupheight_adv', '1', NULL),
(593, 2, 1364029235, 'resource', 'filterfiles', '0', NULL),
(594, 2, 1364029235, 'resource', 'filterfiles_adv', '1', NULL),
(595, 2, 1364029235, 'scorm', 'displaycoursestructure', '0', NULL),
(596, 2, 1364029235, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(597, 2, 1364029235, 'scorm', 'popup', '0', NULL),
(598, 2, 1364029235, 'scorm', 'popup_adv', '0', NULL),
(599, 2, 1364029235, 'scorm', 'framewidth', '100', NULL),
(600, 2, 1364029235, 'scorm', 'framewidth_adv', '1', NULL),
(601, 2, 1364029235, 'scorm', 'frameheight', '500', NULL),
(602, 2, 1364029235, 'scorm', 'frameheight_adv', '1', NULL),
(603, 2, 1364029235, 'scorm', 'winoptgrp_adv', '1', NULL),
(604, 2, 1364029235, 'scorm', 'resizable', '0', NULL),
(605, 2, 1364029235, 'scorm', 'scrollbars', '0', NULL),
(606, 2, 1364029235, 'scorm', 'directories', '0', NULL),
(607, 2, 1364029235, 'scorm', 'location', '0', NULL),
(608, 2, 1364029235, 'scorm', 'menubar', '0', NULL),
(609, 2, 1364029235, 'scorm', 'toolbar', '0', NULL),
(610, 2, 1364029235, 'scorm', 'status', '0', NULL),
(611, 2, 1364029235, 'scorm', 'skipview', '0', NULL),
(612, 2, 1364029235, 'scorm', 'skipview_adv', '1', NULL),
(613, 2, 1364029235, 'scorm', 'hidebrowse', '0', NULL),
(614, 2, 1364029235, 'scorm', 'hidebrowse_adv', '1', NULL),
(615, 2, 1364029235, 'scorm', 'hidetoc', '0', NULL),
(616, 2, 1364029236, 'scorm', 'hidetoc_adv', '1', NULL),
(617, 2, 1364029236, 'scorm', 'hidenav', '0', NULL),
(618, 2, 1364029236, 'scorm', 'hidenav_adv', '0', NULL),
(619, 2, 1364029236, 'scorm', 'grademethod', '1', NULL),
(620, 2, 1364029236, 'scorm', 'grademethod_adv', '0', NULL),
(621, 2, 1364029236, 'scorm', 'maxgrade', '100', NULL),
(622, 2, 1364029236, 'scorm', 'maxgrade_adv', '0', NULL),
(623, 2, 1364029236, 'scorm', 'maxattempts', '0', NULL),
(624, 2, 1364029236, 'scorm', 'maxattempts_adv', '0', NULL),
(625, 2, 1364029236, 'scorm', 'whatgrade', '0', NULL),
(626, 2, 1364029236, 'scorm', 'whatgrade_adv', '0', NULL),
(627, 2, 1364029236, 'scorm', 'displayattemptstatus', '1', NULL),
(628, 2, 1364029236, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(629, 2, 1364029236, 'scorm', 'forcecompleted', '0', NULL),
(630, 2, 1364029236, 'scorm', 'forcecompleted_adv', '1', NULL),
(631, 2, 1364029236, 'scorm', 'forcenewattempt', '0', NULL),
(632, 2, 1364029236, 'scorm', 'forcenewattempt_adv', '1', NULL),
(633, 2, 1364029236, 'scorm', 'lastattemptlock', '0', NULL),
(634, 2, 1364029236, 'scorm', 'lastattemptlock_adv', '1', NULL),
(635, 2, 1364029236, 'scorm', 'auto', '0', NULL),
(636, 2, 1364029236, 'scorm', 'auto_adv', '1', NULL),
(637, 2, 1364029236, 'scorm', 'updatefreq', '0', NULL),
(638, 2, 1364029236, 'scorm', 'updatefreq_adv', '1', NULL),
(639, 2, 1364029236, 'scorm', 'allowtypeexternal', '0', NULL),
(640, 2, 1364029236, 'scorm', 'allowtypelocalsync', '0', NULL),
(641, 2, 1364029236, 'scorm', 'allowtypeimsrepository', '0', NULL),
(642, 2, 1364029236, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(643, 2, 1364029236, 'scorm', 'allowaicchacp', '0', NULL),
(644, 2, 1364029236, 'scorm', 'aicchacptimeout', '30', NULL),
(645, 2, 1364029236, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(646, 2, 1364029236, 'scorm', 'forcejavascript', '1', NULL),
(647, 2, 1364029236, 'scorm', 'allowapidebug', '0', NULL),
(648, 2, 1364029236, 'scorm', 'apidebugmask', '.*', NULL),
(649, 2, 1364029236, 'url', 'framesize', '130', NULL),
(650, 2, 1364029236, 'url', 'requiremodintro', '1', NULL),
(651, 2, 1364029236, 'url', 'secretphrase', '', NULL),
(652, 2, 1364029236, 'url', 'rolesinparams', '0', NULL),
(653, 2, 1364029236, 'url', 'displayoptions', '0,1,5,6', NULL),
(654, 2, 1364029236, 'url', 'printheading', '0', NULL),
(655, 2, 1364029236, 'url', 'printheading_adv', '0', NULL),
(656, 2, 1364029236, 'url', 'printintro', '1', NULL),
(657, 2, 1364029236, 'url', 'printintro_adv', '0', NULL),
(658, 2, 1364029236, 'url', 'display', '0', NULL),
(659, 2, 1364029236, 'url', 'display_adv', '0', NULL),
(660, 2, 1364029236, 'url', 'popupwidth', '620', NULL),
(661, 2, 1364029236, 'url', 'popupwidth_adv', '1', NULL),
(662, 2, 1364029236, 'url', 'popupheight', '450', NULL),
(663, 2, 1364029236, 'url', 'popupheight_adv', '1', NULL),
(664, 2, 1364029236, 'workshop', 'grade', '80', NULL),
(665, 2, 1364029236, 'workshop', 'gradinggrade', '20', NULL),
(666, 2, 1364029236, 'workshop', 'gradedecimals', '0', NULL),
(667, 2, 1364029236, 'workshop', 'maxbytes', '0', NULL),
(668, 2, 1364029236, 'workshop', 'strategy', 'accumulative', NULL),
(669, 2, 1364029236, 'workshop', 'examplesmode', '0', NULL),
(670, 2, 1364029236, 'workshopallocation_random', 'numofreviews', '5', NULL),
(671, 2, 1364029236, 'workshopform_numerrors', 'grade0', 'No', NULL),
(672, 2, 1364029236, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(673, 2, 1364029236, 'workshopeval_best', 'comparison', '5', NULL),
(674, 2, 1364029236, NULL, 'block_course_list_adminview', 'all', NULL),
(675, 2, 1364029236, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(676, 2, 1364029236, NULL, 'block_online_users_timetosee', '5', NULL),
(677, 2, 1364029236, NULL, 'block_rss_client_num_entries', '5', NULL),
(678, 2, 1364029236, NULL, 'block_rss_client_timeout', '30', NULL),
(679, 2, 1364029236, 'blocks/section_links', 'numsections1', '22', NULL),
(680, 2, 1364029236, 'blocks/section_links', 'incby1', '2', NULL),
(681, 2, 1364029236, 'blocks/section_links', 'numsections2', '40', NULL),
(682, 2, 1364029236, 'blocks/section_links', 'incby2', '5', NULL),
(683, 2, 1364029236, NULL, 'block_tags_showcoursetags', '0', NULL),
(684, 2, 1364029236, NULL, 'jabberhost', '', NULL),
(685, 2, 1364029236, NULL, 'jabberserver', '', NULL),
(686, 2, 1364029236, NULL, 'jabberusername', '', NULL),
(687, 2, 1364029236, NULL, 'jabberpassword', '', NULL),
(688, 2, 1364029236, NULL, 'jabberport', '5222', NULL),
(689, 2, 1364029236, NULL, 'smtphosts', '', NULL),
(690, 2, 1364029236, NULL, 'smtpuser', '', NULL),
(691, 2, 1364029236, NULL, 'smtppass', '', NULL),
(692, 2, 1364029236, NULL, 'smtpmaxbulk', '1', NULL),
(693, 2, 1364029236, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(694, 2, 1364029236, NULL, 'sitemailcharset', '0', NULL),
(695, 2, 1364029236, NULL, 'allowusermailcharset', '0', NULL),
(696, 2, 1364029236, NULL, 'mailnewline', 'LF', NULL),
(697, 2, 1364029236, 'enrol_cohort', 'roleid', '5', NULL),
(698, 2, 1364029236, 'enrol_database', 'defaultrole', '5', NULL),
(699, 2, 1364029236, 'enrol_database', 'defaultcategory', '1', NULL),
(700, 2, 1364029237, 'enrol_flatfile', 'map_1', 'manager', NULL),
(701, 2, 1364029237, 'enrol_flatfile', 'map_2', 'coursecreator', NULL),
(702, 2, 1364029237, 'enrol_flatfile', 'map_3', 'editingteacher', NULL),
(703, 2, 1364029237, 'enrol_flatfile', 'map_4', 'teacher', NULL),
(704, 2, 1364029237, 'enrol_flatfile', 'map_5', 'student', NULL),
(705, 2, 1364029237, 'enrol_flatfile', 'map_6', 'guest', NULL),
(706, 2, 1364029237, 'enrol_flatfile', 'map_7', 'user', NULL),
(707, 2, 1364029237, 'enrol_flatfile', 'map_8', 'frontpage', NULL),
(708, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(709, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(710, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(711, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(712, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(713, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(714, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(715, 2, 1364029237, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(716, 2, 1364029237, 'enrol_manual', 'roleid', '5', NULL),
(717, 2, 1364029237, 'enrol_meta', 'nosyncroleids', '', NULL),
(718, 2, 1364029237, 'enrol_meta', 'syncall', '1', NULL),
(719, 2, 1364029237, 'enrol_meta', 'unenrolaction', '0', NULL),
(720, 2, 1364029237, 'enrol_mnet', 'roleid', '5', NULL),
(721, 2, 1364029237, 'enrol_mnet', 'roleid_adv', '1', NULL),
(722, 2, 1364029237, 'enrol_paypal', 'roleid', '5', NULL),
(723, 2, 1364029237, 'enrol_self', 'roleid', '5', NULL),
(724, 2, 1364029237, NULL, 'profileroles', '5,4,3', NULL),
(725, 2, 1364029237, NULL, 'defaultallowedmodules', '', NULL),
(726, 2, 1364029237, NULL, 'coursecontact', '3', NULL),
(727, 2, 1364029237, NULL, 'frontpage', '1', NULL),
(728, 2, 1364029237, NULL, 'frontpageloggedin', '1', NULL),
(729, 2, 1364029237, NULL, 'maxcategorydepth', '0', NULL),
(730, 2, 1364029237, NULL, 'commentsperpage', '15', NULL),
(731, 2, 1364029237, NULL, 'coursesperpage', '20', NULL),
(732, 2, 1364029237, NULL, 'defaultfrontpageroleid', '8', NULL),
(733, 2, 1364029237, NULL, 'supportname', 'Admin User', NULL),
(734, 2, 1364029237, NULL, 'supportemail', 'ankit@eneev.com', NULL),
(735, 2, 1364029267, NULL, 'registerauth', '', NULL),
(736, 2, 1364034698, NULL, 'themedesignermode', '1', '0'),
(737, 2, 1364202613, NULL, 'debug', '38911', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=752 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'format', 'weeks'),
(2, 'moodlecourse', 'maxsections', '52'),
(3, 'moodlecourse', 'numsections', '10'),
(4, 'moodlecourse', 'hiddensections', '0'),
(5, 'moodlecourse', 'newsitems', '5'),
(6, 'moodlecourse', 'showgrades', '1'),
(7, 'moodlecourse', 'showreports', '0'),
(8, 'moodlecourse', 'maxbytes', '83886080'),
(9, 'moodlecourse', 'groupmode', '0'),
(10, 'moodlecourse', 'groupmodeforce', '0'),
(11, 'moodlecourse', 'visible', '1'),
(12, 'moodlecourse', 'lang', ''),
(13, 'moodlecourse', 'enablecompletion', '0'),
(14, 'moodlecourse', 'completionstartonenrol', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', '0'),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', '0'),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', '0'),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', '0'),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', '0'),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', '0'),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', '0'),
(30, 'backup', 'backup_general_userscompletion', '1'),
(31, 'backup', 'backup_general_userscompletion_locked', '0'),
(32, 'backup', 'backup_general_logs', '0'),
(33, 'backup', 'backup_general_logs_locked', '0'),
(34, 'backup', 'backup_general_histories', '0'),
(35, 'backup', 'backup_general_histories_locked', '0'),
(36, 'backup', 'backup_auto_active', '0'),
(37, 'backup', 'backup_auto_weekdays', '0000000'),
(38, 'backup', 'backup_auto_hour', '0'),
(39, 'backup', 'backup_auto_minute', '0'),
(40, 'backup', 'backup_auto_storage', '0'),
(41, 'backup', 'backup_auto_destination', ''),
(42, 'backup', 'backup_auto_keep', '1'),
(43, 'backup', 'backup_shortname', '0'),
(44, 'backup', 'backup_auto_users', '1'),
(45, 'backup', 'backup_auto_role_assignments', '1'),
(46, 'backup', 'backup_auto_activities', '1'),
(47, 'backup', 'backup_auto_blocks', '1'),
(48, 'backup', 'backup_auto_filters', '1'),
(49, 'backup', 'backup_auto_comments', '1'),
(50, 'backup', 'backup_auto_userscompletion', '1'),
(51, 'backup', 'backup_auto_logs', '0'),
(52, 'backup', 'backup_auto_histories', '0'),
(53, 'enrol_database', 'dbtype', ''),
(54, 'enrol_database', 'dbhost', 'localhost'),
(55, 'enrol_database', 'dbuser', ''),
(56, 'enrol_database', 'dbpass', ''),
(57, 'enrol_database', 'dbname', ''),
(58, 'enrol_database', 'dbencoding', 'utf-8'),
(59, 'enrol_database', 'dbsetupsql', ''),
(60, 'enrol_database', 'dbsybasequoting', '0'),
(61, 'enrol_database', 'debugdb', '0'),
(62, 'enrol_database', 'localcoursefield', 'idnumber'),
(63, 'enrol_database', 'localuserfield', 'idnumber'),
(64, 'enrol_database', 'localrolefield', 'shortname'),
(65, 'enrol_database', 'remoteenroltable', ''),
(66, 'enrol_database', 'remotecoursefield', ''),
(67, 'enrol_database', 'remoteuserfield', ''),
(68, 'enrol_database', 'remoterolefield', ''),
(69, 'enrol_database', 'ignorehiddencourses', '0'),
(70, 'enrol_database', 'unenrolaction', '0'),
(71, 'enrol_database', 'newcoursetable', ''),
(72, 'enrol_database', 'newcoursefullname', 'fullname'),
(73, 'enrol_database', 'newcourseshortname', 'shortname'),
(74, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(75, 'enrol_database', 'newcoursecategory', ''),
(76, 'enrol_database', 'templatecourse', ''),
(77, 'enrol_flatfile', 'location', ''),
(78, 'enrol_flatfile', 'mailstudents', '0'),
(79, 'enrol_flatfile', 'mailteachers', '0'),
(80, 'enrol_flatfile', 'mailadmins', '0'),
(81, 'enrol_guest', 'requirepassword', '0'),
(82, 'enrol_guest', 'usepasswordpolicy', '0'),
(83, 'enrol_guest', 'showhint', '0'),
(84, 'enrol_guest', 'defaultenrol', '1'),
(85, 'enrol_guest', 'status', '1'),
(86, 'enrol_guest', 'status_adv', '0'),
(87, 'enrol_imsenterprise', 'imsfilelocation', ''),
(88, 'enrol_imsenterprise', 'logtolocation', ''),
(89, 'enrol_imsenterprise', 'mailadmins', '0'),
(90, 'enrol_imsenterprise', 'createnewusers', '0'),
(91, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(92, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(93, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(94, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(95, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(96, 'enrol_imsenterprise', 'createnewcourses', '0'),
(97, 'enrol_imsenterprise', 'createnewcategories', '0'),
(98, 'enrol_imsenterprise', 'imsunenrol', '0'),
(99, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(100, 'enrol_imsenterprise', 'imscapitafix', '0'),
(101, 'enrol_manual', 'defaultenrol', '1'),
(102, 'enrol_manual', 'status', '0'),
(103, 'enrol_manual', 'enrolperiod', '0'),
(104, 'enrol_paypal', 'paypalbusiness', ''),
(105, 'enrol_paypal', 'mailstudents', '0'),
(106, 'enrol_paypal', 'mailteachers', '0'),
(107, 'enrol_paypal', 'mailadmins', '0'),
(108, 'enrol_paypal', 'status', '1'),
(109, 'enrol_paypal', 'cost', '0'),
(110, 'enrol_paypal', 'currency', 'USD'),
(111, 'enrol_paypal', 'enrolperiod', '0'),
(112, 'enrol_self', 'requirepassword', '0'),
(113, 'enrol_self', 'usepasswordpolicy', '0'),
(114, 'enrol_self', 'showhint', '0'),
(115, 'enrol_self', 'defaultenrol', '1'),
(116, 'enrol_self', 'status', '1'),
(117, 'enrol_self', 'groupkey', '0'),
(118, 'enrol_self', 'enrolperiod', '0'),
(119, 'enrol_self', 'longtimenosee', '0'),
(120, 'enrol_self', 'maxenrolled', '0'),
(121, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(122, 'editor_tinymce', 'spellengine', 'GoogleSpell'),
(123, 'editor_tinymce', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(124, 'filter_urltolink', 'formats', '0'),
(125, 'filter_urltolink', 'embedimages', '1'),
(126, 'filter_emoticon', 'formats', '1,4,0'),
(127, 'theme_afterburner', 'logo', ''),
(128, 'theme_afterburner', 'footnote', ''),
(129, 'theme_afterburner', 'customcss', ''),
(130, 'theme_arialist', 'logo', ''),
(131, 'theme_arialist', 'tagline', ''),
(132, 'theme_arialist', 'linkcolor', '#f25f0f'),
(133, 'theme_arialist', 'regionwidth', '250'),
(134, 'theme_arialist', 'customcss', ''),
(135, 'theme_brick', 'logo', ''),
(136, 'theme_brick', 'linkcolor', '#06365b'),
(137, 'theme_brick', 'linkhover', '#5487ad'),
(138, 'theme_brick', 'maincolor', '#8e2800'),
(139, 'theme_brick', 'maincolorlink', '#fff0a5'),
(140, 'theme_brick', 'headingcolor', '#5c3500'),
(141, 'theme_formal_white', 'fontsizereference', '13'),
(142, 'theme_formal_white', 'noframe', '0'),
(143, 'theme_formal_white', 'displaylogo', '1'),
(144, 'theme_formal_white', 'logo', ''),
(145, 'theme_formal_white', 'frontpagelogo', ''),
(146, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(147, 'theme_formal_white', 'creditstomoodleorg', '2'),
(148, 'theme_formal_white', 'blockcolumnwidth', '200'),
(149, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(150, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(151, 'theme_formal_white', 'rblockcolumnbgc', ''),
(152, 'theme_formal_white', 'footnote', ''),
(153, 'theme_formal_white', 'customcss', ''),
(154, 'theme_fusion', 'linkcolor', '#2d83d5'),
(155, 'theme_fusion', 'tagline', ''),
(156, 'theme_fusion', 'footertext', ''),
(157, 'theme_fusion', 'customcss', ''),
(158, 'theme_magazine', 'background', ''),
(159, 'theme_magazine', 'logo', ''),
(160, 'theme_magazine', 'linkcolor', '#32529a'),
(161, 'theme_magazine', 'linkhover', '#4e2300'),
(162, 'theme_magazine', 'maincolor', '#002f2f'),
(163, 'theme_magazine', 'maincoloraccent', '#092323'),
(164, 'theme_magazine', 'headingcolor', '#4e0000'),
(165, 'theme_magazine', 'blockcolor', '#002f2f'),
(166, 'theme_magazine', 'forumback', '#e6e2af'),
(167, 'theme_mymobile', 'colourswatch', 'light'),
(168, 'theme_mymobile', 'showmobileintro', ''),
(169, 'theme_mymobile', 'showsitetopic', 'topicshow'),
(170, 'theme_mymobile', 'showfullsizeimages', 'ithumb'),
(171, 'theme_mymobile', 'usetableview', 'tabshow'),
(172, 'theme_nimble', 'tagline', ''),
(173, 'theme_nimble', 'footerline', ''),
(174, 'theme_nimble', 'backgroundcolor', '#454545'),
(175, 'theme_nimble', 'linkcolor', '#2a65b1'),
(176, 'theme_nimble', 'linkhover', '#222222'),
(177, 'theme_nonzero', 'regionprewidth', '200'),
(178, 'theme_nonzero', 'regionpostwidth', '200'),
(179, 'theme_nonzero', 'customcss', ''),
(180, 'theme_overlay', 'linkcolor', '#428ab5'),
(181, 'theme_overlay', 'headercolor', '#2a4c7b'),
(182, 'theme_overlay', 'footertext', ''),
(183, 'theme_overlay', 'customcss', ''),
(184, 'theme_sky_high', 'logo', ''),
(185, 'theme_sky_high', 'regionwidth', '240'),
(186, 'theme_sky_high', 'footnote', ''),
(187, 'theme_sky_high', 'customcss', ''),
(188, 'theme_splash', 'logo', ''),
(189, 'theme_splash', 'tagline', 'Virtual learning center'),
(190, 'theme_splash', 'hide_tagline', '0'),
(191, 'theme_splash', 'footnote', ''),
(192, 'theme_splash', 'customcss', ''),
(193, 'qtype_calculated', 'version', '2011102700'),
(194, 'qtype_calculatedmulti', 'version', '2011102700'),
(195, 'qtype_calculatedsimple', 'version', '2011102700'),
(196, 'qtype_description', 'version', '2011102700'),
(197, 'qtype_essay', 'version', '2011102702'),
(198, 'qtype_match', 'version', '2011102700'),
(199, 'qtype_missingtype', 'version', '2011102700'),
(200, 'qtype_multianswer', 'version', '2011102700'),
(201, 'qtype_multichoice', 'version', '2011102700'),
(202, 'qtype_numerical', 'version', '2011102700'),
(203, 'qtype_random', 'version', '2011102700'),
(204, 'qtype_randomsamatch', 'version', '2010090501'),
(205, 'qtype_shortanswer', 'version', '2011102700'),
(206, 'qtype_truefalse', 'version', '2011102700'),
(215, 'auth_cas', 'version', '2011112900'),
(217, 'auth_db', 'version', '2011112900'),
(219, 'auth_email', 'version', '2011112900'),
(220, 'auth_fc', 'version', '2011112900'),
(222, 'auth_imap', 'version', '2011112900'),
(224, 'auth_ldap', 'version', '2011112900'),
(226, 'auth_manual', 'version', '2011112900'),
(227, 'auth_mnet', 'version', '2011112900'),
(229, 'auth_nntp', 'version', '2011112900'),
(231, 'auth_nologin', 'version', '2011112900'),
(232, 'auth_none', 'version', '2011112900'),
(233, 'auth_pam', 'version', '2011112900'),
(235, 'auth_pop3', 'version', '2011112900'),
(237, 'auth_radius', 'version', '2011112900'),
(239, 'auth_shibboleth', 'version', '2011112900'),
(241, 'auth_webservice', 'version', '2011112900'),
(242, 'enrol_authorize', 'version', '2011112902'),
(243, 'enrol_category', 'version', '2011112900'),
(245, 'enrol_cohort', 'version', '2011112900'),
(246, 'enrol_database', 'version', '2011112900'),
(248, 'enrol_flatfile', 'version', '2011112901'),
(249, 'enrol_guest', 'version', '2011112901'),
(251, 'enrol_imsenterprise', 'version', '2011112901'),
(253, 'enrol_ldap', 'version', '2011112900'),
(255, 'enrol_manual', 'version', '2011112901'),
(257, 'enrol_meta', 'version', '2011112901'),
(259, 'enrol_mnet', 'version', '2011112900'),
(260, 'enrol_paypal', 'version', '2011112901'),
(261, 'enrol_self', 'version', '2011112900'),
(263, 'message_email', 'version', '2011112900'),
(265, 'message', 'email_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(266, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedin', 'email'),
(267, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedoff', 'email'),
(268, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(269, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(270, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(271, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(272, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(273, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(274, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(275, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(276, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(277, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(278, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(279, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(280, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(281, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(282, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(283, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(284, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(285, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(286, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(287, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(288, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(289, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(290, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(291, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(292, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(293, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(294, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(295, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(296, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(297, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(298, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(299, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(300, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(301, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(302, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(303, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(304, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(305, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(306, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(307, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(308, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(309, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(310, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(311, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(312, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(313, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(314, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(315, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(316, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(317, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(318, 'message_jabber', 'version', '2011112900'),
(320, 'message', 'jabber_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(321, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(322, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(323, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(324, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(325, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(326, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(327, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(328, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(329, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(330, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(331, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(332, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(333, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(334, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(335, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(336, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(337, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(338, 'message_popup', 'version', '2011112900'),
(340, 'message', 'popup_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(341, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(342, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(343, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(344, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(345, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(346, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(347, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(348, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(349, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(350, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(351, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(352, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(353, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(354, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(355, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(356, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(357, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(358, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(360, 'filter_activitynames', 'version', '2011112900'),
(361, 'filter_algebra', 'version', '2011112900'),
(362, 'filter_censor', 'version', '2011112900'),
(363, 'filter_data', 'version', '2011102800'),
(365, 'filter_emailprotect', 'version', '2011112900'),
(366, 'filter_emoticon', 'version', '2011112900'),
(367, 'filter_glossary', 'version', '2011102801'),
(369, 'filter_mediaplugin', 'version', '2011112900'),
(371, 'filter_multilang', 'version', '2011112900'),
(372, 'filter_tex', 'version', '2011112900'),
(374, 'filter_tidy', 'version', '2011112900'),
(375, 'filter_urltolink', 'version', '2011112900'),
(376, 'editor_textarea', 'version', '2011112900'),
(377, 'editor_tinymce', 'version', '2012030300'),
(378, 'format_scorm', 'version', '2011120100'),
(379, 'format_social', 'version', '2011120100'),
(380, 'format_topics', 'version', '2011120100'),
(381, 'format_weeks', 'version', '2011120100'),
(382, 'profilefield_checkbox', 'version', '2011112900'),
(383, 'profilefield_datetime', 'version', '2011112900'),
(384, 'profilefield_menu', 'version', '2011112900'),
(385, 'profilefield_text', 'version', '2011112900'),
(386, 'profilefield_textarea', 'version', '2011112900'),
(387, 'report_backups', 'version', '2011110300'),
(388, 'report_completion', 'version', '2011110300'),
(390, 'report_configlog', 'version', '2011110300'),
(391, 'report_courseoverview', 'version', '2011110300'),
(392, 'report_log', 'version', '2011110300'),
(394, 'report_loglive', 'version', '2011110300'),
(395, 'report_outline', 'version', '2011110300'),
(397, 'report_participation', 'version', '2011110300'),
(399, 'report_progress', 'version', '2011110300'),
(401, 'report_questioninstances', 'version', '2011110300'),
(402, 'report_security', 'version', '2011110300'),
(403, 'report_stats', 'version', '2011110300'),
(405, 'gradeexport_ods', 'version', '2011112900'),
(406, 'gradeexport_txt', 'version', '2011112900'),
(407, 'gradeexport_xls', 'version', '2011112900'),
(408, 'gradeexport_xml', 'version', '2011112900'),
(409, 'gradeimport_csv', 'version', '2011112900'),
(410, 'gradeimport_xml', 'version', '2011112900'),
(411, 'gradereport_grader', 'version', '2011112900'),
(412, 'gradereport_outcomes', 'version', '2011112900'),
(413, 'gradereport_overview', 'version', '2011112900'),
(414, 'gradereport_user', 'version', '2011112900'),
(415, 'gradingform_rubric', 'version', '2011110900'),
(416, 'mnetservice_enrol', 'version', '2011112900'),
(417, 'webservice_amf', 'version', '2011112900'),
(418, 'webservice_rest', 'version', '2011112900'),
(419, 'webservice_soap', 'version', '2011112900'),
(420, 'webservice_xmlrpc', 'version', '2011112900'),
(421, 'repository_alfresco', 'version', '2011112900'),
(422, 'repository_boxnet', 'version', '2011112900'),
(423, 'repository_coursefiles', 'version', '2012010100'),
(424, 'repository_dropbox', 'version', '2011112900'),
(425, 'repository_filesystem', 'version', '2012010100'),
(426, 'repository_flickr', 'version', '2011112900'),
(427, 'repository_flickr_public', 'version', '2011112900'),
(428, 'repository_googledocs', 'version', '2011112900'),
(429, 'repository_local', 'version', '2012010100'),
(431, 'local', 'enablecourseinstances', '0'),
(432, 'local', 'enableuserinstances', '0'),
(433, 'repository_merlot', 'version', '2011112900'),
(434, 'repository_picasa', 'version', '2011112900'),
(435, 'repository_recent', 'version', '2011112900'),
(437, 'recent', 'enablecourseinstances', '0'),
(438, 'recent', 'enableuserinstances', '0'),
(439, 'repository_s3', 'version', '2011112900'),
(440, 'repository_upload', 'version', '2011112900'),
(442, 'upload', 'enablecourseinstances', '0'),
(443, 'upload', 'enableuserinstances', '0'),
(444, 'repository_url', 'version', '2011112900'),
(445, 'repository_user', 'version', '2011112900'),
(447, 'user', 'enablecourseinstances', '0'),
(448, 'user', 'enableuserinstances', '0'),
(449, 'repository_webdav', 'version', '2012010100'),
(450, 'repository_wikimedia', 'version', '2011112900'),
(451, 'repository_youtube', 'version', '2011112900'),
(452, 'portfolio_boxnet', 'version', '2011112900'),
(453, 'portfolio_download', 'version', '2011112900'),
(454, 'portfolio_flickr', 'version', '2011112900'),
(455, 'portfolio_googledocs', 'version', '2011112900'),
(456, 'portfolio_mahara', 'version', '2011112900'),
(457, 'portfolio_picasa', 'version', '2011112900'),
(458, 'qbehaviour_adaptive', 'version', '2011102700'),
(459, 'qbehaviour_adaptivenopenalty', 'version', '2011102700'),
(460, 'qbehaviour_deferredcbm', 'version', '2011102700'),
(461, 'qbehaviour_deferredfeedback', 'version', '2011102700'),
(462, 'qbehaviour_immediatecbm', 'version', '2011102700'),
(463, 'qbehaviour_immediatefeedback', 'version', '2011102700'),
(464, 'qbehaviour_informationitem', 'version', '2011102700'),
(465, 'qbehaviour_interactive', 'version', '2011102700'),
(466, 'qbehaviour_interactivecountback', 'version', '2011102700'),
(467, 'qbehaviour_manualgraded', 'version', '2011102700'),
(468, 'qbehaviour_missing', 'version', '2011102700'),
(469, 'qformat_aiken', 'version', '2011102700'),
(470, 'qformat_blackboard', 'version', '2011102701'),
(471, 'qformat_blackboard_six', 'version', '2011102701'),
(472, 'qformat_examview', 'version', '2011102701'),
(473, 'qformat_gift', 'version', '2011102700'),
(474, 'qformat_learnwise', 'version', '2011102700'),
(475, 'qformat_missingword', 'version', '2011102700'),
(476, 'qformat_multianswer', 'version', '2011102700'),
(477, 'qformat_webct', 'version', '2011102700'),
(478, 'qformat_xhtml', 'version', '2011102700'),
(479, 'qformat_xml', 'version', '2011102700'),
(480, 'tool_bloglevelupgrade', 'version', '2011092500'),
(482, 'tool_capability', 'version', '2011092500'),
(483, 'tool_customlang', 'version', '2011092500'),
(485, 'tool_dbtransfer', 'version', '2011092500'),
(486, 'tool_generator', 'version', '2011092500'),
(487, 'tool_health', 'version', '2011092500'),
(488, 'tool_innodb', 'version', '2011092500'),
(489, 'tool_langimport', 'version', '2011092500'),
(490, 'tool_multilangupgrade', 'version', '2011092500'),
(491, 'tool_profiling', 'version', '2011092500'),
(492, 'tool_qeupgradehelper', 'version', '2011092500'),
(494, 'tool_replace', 'version', '2011092500'),
(495, 'tool_spamcleaner', 'version', '2011092500'),
(496, 'tool_timezoneimport', 'version', '2011092500'),
(497, 'tool_unittest', 'version', '2011092500'),
(499, 'tool_unsuproles', 'version', '2011092500'),
(501, 'tool_uploaduser', 'version', '2011092500'),
(502, 'tool_xmldb', 'version', '2011092500'),
(503, 'theme_afterburner', 'version', '2011082400'),
(504, 'theme_anomaly', 'version', '2011082400'),
(505, 'theme_arialist', 'version', '2011082400'),
(506, 'theme_base', 'version', '2011082400'),
(507, 'theme_binarius', 'version', '2011082400'),
(508, 'theme_boxxie', 'version', '2011082400'),
(509, 'theme_brick', 'version', '2011082400'),
(510, 'theme_canvas', 'version', '2011082400'),
(511, 'theme_formal_white', 'version', '2011082400'),
(513, 'theme_formfactor', 'version', '2011082400'),
(514, 'theme_fusion', 'version', '2011082400'),
(515, 'theme_leatherbound', 'version', '2011082400'),
(516, 'theme_magazine', 'version', '2011082400'),
(517, 'theme_mymobile', 'version', '2011101801'),
(518, 'theme_nimble', 'version', '2011082400'),
(519, 'theme_nonzero', 'version', '2011082400'),
(520, 'theme_overlay', 'version', '2011082400'),
(521, 'theme_serenity', 'version', '2011082400'),
(522, 'theme_sky_high', 'version', '2011082400'),
(523, 'theme_splash', 'version', '2011082400'),
(524, 'theme_standard', 'version', '2011082400'),
(525, 'theme_standardold', 'version', '2011082400'),
(526, 'assignment_offline', 'version', '2011112900'),
(527, 'assignment_online', 'version', '2011112900'),
(528, 'assignment_upload', 'version', '2011112900'),
(529, 'assignment_uploadsingle', 'version', '2011112900'),
(530, 'datafield_checkbox', 'version', '2011112900'),
(531, 'datafield_date', 'version', '2011112900'),
(532, 'datafield_file', 'version', '2011112900'),
(533, 'datafield_latlong', 'version', '2011112900'),
(534, 'datafield_menu', 'version', '2011112900'),
(535, 'datafield_multimenu', 'version', '2011112900'),
(536, 'datafield_number', 'version', '2011112900'),
(537, 'datafield_picture', 'version', '2011112900'),
(538, 'datafield_radiobutton', 'version', '2011112900'),
(539, 'datafield_text', 'version', '2011112900'),
(540, 'datafield_textarea', 'version', '2011112900'),
(541, 'datafield_url', 'version', '2011112900'),
(542, 'datapreset_imagegallery', 'version', '2011112900'),
(543, 'quiz_grading', 'version', '2011051200'),
(544, 'quiz_overview', 'version', '2011051200'),
(545, 'quiz_responses', 'version', '2011051200'),
(546, 'quiz_statistics', 'version', '2011122300'),
(548, 'quizaccess_delaybetweenattempts', 'version', '2011092300'),
(549, 'quizaccess_ipaddress', 'version', '2011092300'),
(550, 'quizaccess_numattempts', 'version', '2011092300'),
(551, 'quizaccess_openclosedate', 'version', '2011092300'),
(552, 'quizaccess_password', 'version', '2011092300'),
(553, 'quizaccess_safebrowser', 'version', '2011092300'),
(554, 'quizaccess_securewindow', 'version', '2011092300'),
(555, 'quizaccess_timelimit', 'version', '2011092300'),
(556, 'scormreport_basic', 'version', '2011071100'),
(557, 'scormreport_interactions', 'version', '2011110100'),
(558, 'workshopform_accumulative', 'version', '2010091700'),
(560, 'workshopform_comments', 'version', '2010091700'),
(562, 'workshopform_numerrors', 'version', '2010091700'),
(564, 'workshopform_rubric', 'version', '2010091700'),
(566, 'workshopallocation_manual', 'version', '2010090501'),
(567, 'workshopallocation_random', 'version', '2010090501'),
(568, 'workshopeval_best', 'version', '2010090501'),
(569, 'folder', 'requiremodintro', '1'),
(570, 'imscp', 'requiremodintro', '1'),
(571, 'imscp', 'keepold', '1'),
(572, 'imscp', 'keepold_adv', '0'),
(573, 'page', 'requiremodintro', '1'),
(574, 'page', 'displayoptions', '5'),
(575, 'page', 'printheading', '1'),
(576, 'page', 'printheading_adv', '0'),
(577, 'page', 'printintro', '0'),
(578, 'page', 'printintro_adv', '0'),
(579, 'page', 'display', '5'),
(580, 'page', 'display_adv', '1'),
(581, 'page', 'popupwidth', '620'),
(582, 'page', 'popupwidth_adv', '1'),
(583, 'page', 'popupheight', '450'),
(584, 'page', 'popupheight_adv', '1'),
(585, 'quiz', 'timelimit', '0'),
(586, 'quiz', 'timelimit_adv', '0'),
(587, 'quiz', 'attempts', '0'),
(588, 'quiz', 'attempts_adv', '0'),
(589, 'quiz', 'grademethod', '1'),
(590, 'quiz', 'grademethod_adv', '0'),
(591, 'quiz', 'maximumgrade', '10'),
(592, 'quiz', 'shufflequestions', '0'),
(593, 'quiz', 'shufflequestions_adv', '0'),
(594, 'quiz', 'questionsperpage', '1'),
(595, 'quiz', 'questionsperpage_adv', '0'),
(596, 'quiz', 'shuffleanswers', '1'),
(597, 'quiz', 'shuffleanswers_adv', '0'),
(598, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(599, 'quiz', 'attemptonlast', '0'),
(600, 'quiz', 'attemptonlast_adv', '1'),
(601, 'quiz', 'reviewattempt', '69904'),
(602, 'quiz', 'reviewcorrectness', '69904'),
(603, 'quiz', 'reviewmarks', '69904'),
(604, 'quiz', 'reviewspecificfeedback', '69904'),
(605, 'quiz', 'reviewgeneralfeedback', '69904'),
(606, 'quiz', 'reviewrightanswer', '69904'),
(607, 'quiz', 'reviewoverallfeedback', '4368'),
(608, 'quiz', 'showuserpicture', '0'),
(609, 'quiz', 'showuserpicture_adv', '0'),
(610, 'quiz', 'decimalpoints', '2'),
(611, 'quiz', 'decimalpoints_adv', '0'),
(612, 'quiz', 'questiondecimalpoints', '-1'),
(613, 'quiz', 'questiondecimalpoints_adv', '0'),
(614, 'quiz', 'showblocks', '0'),
(615, 'quiz', 'showblocks_adv', '1'),
(616, 'quiz', 'password', ''),
(617, 'quiz', 'password_adv', '0'),
(618, 'quiz', 'subnet', ''),
(619, 'quiz', 'subnet_adv', '0'),
(620, 'quiz', 'delay1', '0'),
(621, 'quiz', 'delay1_adv', '0'),
(622, 'quiz', 'delay2', '0'),
(623, 'quiz', 'delay2_adv', '0'),
(624, 'quiz', 'browsersecurity', '-'),
(625, 'quiz', 'browsersecurity_adv', '1'),
(626, 'resource', 'framesize', '130'),
(627, 'resource', 'requiremodintro', '1'),
(628, 'resource', 'displayoptions', '0,1,4,5,6'),
(629, 'resource', 'printheading', '0'),
(630, 'resource', 'printheading_adv', '0'),
(631, 'resource', 'printintro', '1'),
(632, 'resource', 'printintro_adv', '0'),
(633, 'resource', 'display', '0'),
(634, 'resource', 'display_adv', '0'),
(635, 'resource', 'popupwidth', '620'),
(636, 'resource', 'popupwidth_adv', '1'),
(637, 'resource', 'popupheight', '450'),
(638, 'resource', 'popupheight_adv', '1'),
(639, 'resource', 'filterfiles', '0'),
(640, 'resource', 'filterfiles_adv', '1'),
(641, 'scorm', 'displaycoursestructure', '0'),
(642, 'scorm', 'displaycoursestructure_adv', '0'),
(643, 'scorm', 'popup', '0'),
(644, 'scorm', 'popup_adv', '0'),
(645, 'scorm', 'framewidth', '100'),
(646, 'scorm', 'framewidth_adv', '1'),
(647, 'scorm', 'frameheight', '500'),
(648, 'scorm', 'frameheight_adv', '1'),
(649, 'scorm', 'winoptgrp_adv', '1'),
(650, 'scorm', 'resizable', '0'),
(651, 'scorm', 'scrollbars', '0'),
(652, 'scorm', 'directories', '0'),
(653, 'scorm', 'location', '0'),
(654, 'scorm', 'menubar', '0'),
(655, 'scorm', 'toolbar', '0'),
(656, 'scorm', 'status', '0'),
(657, 'scorm', 'skipview', '0'),
(658, 'scorm', 'skipview_adv', '1'),
(659, 'scorm', 'hidebrowse', '0'),
(660, 'scorm', 'hidebrowse_adv', '1'),
(661, 'scorm', 'hidetoc', '0'),
(662, 'scorm', 'hidetoc_adv', '1'),
(663, 'scorm', 'hidenav', '0'),
(664, 'scorm', 'hidenav_adv', '0'),
(665, 'scorm', 'grademethod', '1'),
(666, 'scorm', 'grademethod_adv', '0'),
(667, 'scorm', 'maxgrade', '100'),
(668, 'scorm', 'maxgrade_adv', '0'),
(669, 'scorm', 'maxattempts', '0'),
(670, 'scorm', 'maxattempts_adv', '0'),
(671, 'scorm', 'whatgrade', '0'),
(672, 'scorm', 'whatgrade_adv', '0'),
(673, 'scorm', 'displayattemptstatus', '1'),
(674, 'scorm', 'displayattemptstatus_adv', '0'),
(675, 'scorm', 'forcecompleted', '0'),
(676, 'scorm', 'forcecompleted_adv', '1'),
(677, 'scorm', 'forcenewattempt', '0'),
(678, 'scorm', 'forcenewattempt_adv', '1'),
(679, 'scorm', 'lastattemptlock', '0'),
(680, 'scorm', 'lastattemptlock_adv', '1'),
(681, 'scorm', 'auto', '0'),
(682, 'scorm', 'auto_adv', '1'),
(683, 'scorm', 'updatefreq', '0'),
(684, 'scorm', 'updatefreq_adv', '1'),
(685, 'scorm', 'allowtypeexternal', '0'),
(686, 'scorm', 'allowtypelocalsync', '0'),
(687, 'scorm', 'allowtypeimsrepository', '0'),
(688, 'scorm', 'allowtypeexternalaicc', '0'),
(689, 'scorm', 'allowaicchacp', '0'),
(690, 'scorm', 'aicchacptimeout', '30'),
(691, 'scorm', 'aicchacpkeepsessiondata', '1'),
(692, 'scorm', 'forcejavascript', '1'),
(693, 'scorm', 'allowapidebug', '0'),
(694, 'scorm', 'apidebugmask', '.*'),
(695, 'url', 'framesize', '130'),
(696, 'url', 'requiremodintro', '1'),
(697, 'url', 'secretphrase', ''),
(698, 'url', 'rolesinparams', '0'),
(699, 'url', 'displayoptions', '0,1,5,6'),
(700, 'url', 'printheading', '0'),
(701, 'url', 'printheading_adv', '0'),
(702, 'url', 'printintro', '1'),
(703, 'url', 'printintro_adv', '0'),
(704, 'url', 'display', '0'),
(705, 'url', 'display_adv', '0'),
(706, 'url', 'popupwidth', '620'),
(707, 'url', 'popupwidth_adv', '1'),
(708, 'url', 'popupheight', '450'),
(709, 'url', 'popupheight_adv', '1'),
(710, 'workshop', 'grade', '80'),
(711, 'workshop', 'gradinggrade', '20'),
(712, 'workshop', 'gradedecimals', '0'),
(713, 'workshop', 'maxbytes', '0'),
(714, 'workshop', 'strategy', 'accumulative'),
(715, 'workshop', 'examplesmode', '0'),
(716, 'workshopallocation_random', 'numofreviews', '5'),
(717, 'workshopform_numerrors', 'grade0', 'No'),
(718, 'workshopform_numerrors', 'grade1', 'Yes'),
(719, 'workshopeval_best', 'comparison', '5'),
(720, 'blocks/section_links', 'numsections1', '22'),
(721, 'blocks/section_links', 'incby1', '2'),
(722, 'blocks/section_links', 'numsections2', '40'),
(723, 'blocks/section_links', 'incby2', '5'),
(724, 'enrol_cohort', 'roleid', '5'),
(725, 'enrol_database', 'defaultrole', '5'),
(726, 'enrol_database', 'defaultcategory', '1'),
(727, 'enrol_flatfile', 'map_1', 'manager'),
(728, 'enrol_flatfile', 'map_2', 'coursecreator'),
(729, 'enrol_flatfile', 'map_3', 'editingteacher'),
(730, 'enrol_flatfile', 'map_4', 'teacher'),
(731, 'enrol_flatfile', 'map_5', 'student'),
(732, 'enrol_flatfile', 'map_6', 'guest'),
(733, 'enrol_flatfile', 'map_7', 'user'),
(734, 'enrol_flatfile', 'map_8', 'frontpage'),
(735, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(736, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(737, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(738, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(739, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(740, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(741, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(742, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(743, 'enrol_manual', 'roleid', '5'),
(744, 'enrol_meta', 'nosyncroleids', ''),
(745, 'enrol_meta', 'syncall', '1'),
(746, 'enrol_meta', 'unenrolaction', '0'),
(747, 'enrol_mnet', 'roleid', '5'),
(748, 'enrol_mnet', 'roleid_adv', '1'),
(749, 'enrol_paypal', 'roleid', '5'),
(750, 'enrol_self', 'roleid', '5'),
(751, 'theme_pristine', 'version', '2011082400');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=48 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 50, 2, '/1/3/15', 3),
(20, 50, 3, '/1/3/20', 3),
(27, 70, 3, '/1/3/15/27', 4),
(28, 70, 4, '/1/3/15/28', 4),
(29, 70, 5, '/1/3/20/29', 4),
(30, 70, 6, '/1/3/20/30', 4),
(31, 70, 7, '/1/3/20/31', 4),
(32, 70, 8, '/1/3/20/32', 4),
(33, 70, 9, '/1/3/20/33', 4),
(34, 70, 10, '/1/3/20/34', 4),
(35, 70, 11, '/1/3/20/35', 4),
(36, 70, 12, '/1/3/20/36', 4),
(37, 70, 13, '/1/3/15/37', 4),
(38, 70, 14, '/1/3/15/38', 4),
(39, 70, 15, '/1/3/15/39', 4),
(40, 70, 16, '/1/3/15/40', 4),
(41, 70, 17, '/1/3/15/41', 4),
(42, 70, 18, '/1/3/15/42', 4),
(43, 70, 19, '/1/3/15/43', 4),
(44, 70, 20, '/1/3/15/44', 4),
(45, 70, 21, '/1/3/15/45', 4),
(46, 70, 22, '/1/3/15/46', 4),
(47, 30, 3, '/1/47', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` text,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modinfo` longtext,
  `newsitems` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `startdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numsections` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `marker` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `showreports` smallint(4) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hiddensections` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `groupmode` smallint(4) unsigned NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `restrictmodules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `modinfo`, `newsitems`, `startdate`, `numsections`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `hiddensections`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `restrictmodules`, `enablecompletion`, `completionstartonenrol`, `completionnotify`) VALUES
(1, 0, 1, 'edupristine-open', 'something', '', '<p>iho</p>', 0, 'site', 1, 'a:0:{}', 3, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1364029010, 1364029267, 0, 0, 0, 0, 0),
(2, 1, 10002, 'CFA Level 1', 'cfa1', '', '<p>something</p>', 1, 'topics', 1, 'a:12:{i:3;O:8:"stdClass":10:{s:2:"id";s:1:"1";s:2:"cm";s:1:"3";s:3:"mod";s:4:"page";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"13";s:5:"added";s:10:"1364039645";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:58:"Bond Features, Coupon Structures, Floating Rate Securities";}i:14;O:8:"stdClass":10:{s:2:"id";s:1:"6";s:2:"cm";s:2:"14";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194925";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:58:"Bond Features, Coupon Structures, Floating Rate Securities";}i:19;O:8:"stdClass":11:{s:2:"id";s:1:"1";s:2:"cm";s:2:"19";s:3:"mod";s:3:"url";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"18";s:5:"added";s:10:"1364196954";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"icon";s:5:"f/pdf";s:4:"name";s:58:"Bond Features, Coupon Structures, Floating Rate Securities";}i:4;O:8:"stdClass":10:{s:2:"id";s:1:"2";s:2:"cm";s:1:"4";s:3:"mod";s:4:"page";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"13";s:5:"added";s:10:"1364039722";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:51:"Bond Indenture, Affirmative and Negative Convenants";}i:13;O:8:"stdClass":10:{s:2:"id";s:1:"5";s:2:"cm";s:2:"13";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194888";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:51:"Bond Indenture, Affirmative and Negative Convenants";}i:20;O:8:"stdClass":11:{s:2:"id";s:1:"2";s:2:"cm";s:2:"20";s:3:"mod";s:3:"url";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"15";s:6:"module";s:2:"18";s:5:"added";s:10:"1364197106";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"icon";s:5:"f/pdf";s:4:"name";s:51:"Bond Indenture, Affirmative and Negative Convenants";}i:15;O:8:"stdClass":10:{s:2:"id";s:1:"7";s:2:"cm";s:2:"15";s:3:"mod";s:4:"page";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"13";s:5:"added";s:10:"1364196575";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:48:"Description of CFAI Professional Conduct Program";}i:17;O:8:"stdClass":10:{s:2:"id";s:1:"7";s:2:"cm";s:2:"17";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"14";s:5:"added";s:10:"1364196670";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:48:"Description of CFAI Professional Conduct Program";}i:21;O:8:"stdClass":11:{s:2:"id";s:1:"3";s:2:"cm";s:2:"21";s:3:"mod";s:3:"url";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"18";s:5:"added";s:10:"1364197208";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"icon";s:5:"f/pdf";s:4:"name";s:48:"Description of CFAI Professional Conduct Program";}i:16;O:8:"stdClass":10:{s:2:"id";s:1:"8";s:2:"cm";s:2:"16";s:3:"mod";s:4:"page";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"13";s:5:"added";s:10:"1364196624";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:51:"Basics of Code of Ethics and Professional Standards";}i:18;O:8:"stdClass":10:{s:2:"id";s:1:"8";s:2:"cm";s:2:"18";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"14";s:5:"added";s:10:"1364196699";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:51:"Basics of Code of Ethics and Professional Standards";}i:22;O:8:"stdClass":11:{s:2:"id";s:1:"4";s:2:"cm";s:2:"22";s:3:"mod";s:3:"url";s:7:"section";s:1:"2";s:9:"sectionid";s:2:"16";s:6:"module";s:2:"18";s:5:"added";s:10:"1364197243";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"icon";s:5:"f/pdf";s:4:"name";s:51:"Basics of Code of Ethics and Professional Standards";}}', 5, 1364063400, 3, 0, 83886080, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1364029320, 1364194792, 0, 0, 0, 0, 0),
(3, 1, 10001, 'Financial Modeling', 'FM', '', '<p>uh</p>', 1, 'topics', 1, 'a:8:{i:6;O:8:"stdClass":10:{s:2:"id";s:1:"4";s:2:"cm";s:1:"6";s:3:"mod";s:4:"page";s:7:"section";s:1:"1";s:9:"sectionid";s:1:"5";s:6:"module";s:2:"13";s:5:"added";s:10:"1364193891";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:35:"Introduction To Cash Flow Statement";}i:5;O:8:"stdClass":10:{s:2:"id";s:1:"3";s:2:"cm";s:1:"5";s:3:"mod";s:4:"page";s:7:"section";s:1:"1";s:9:"sectionid";s:1:"5";s:6:"module";s:2:"13";s:5:"added";s:10:"1364193857";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:38:"Creating A Layout For Integrated Model";}i:9;O:8:"stdClass":10:{s:2:"id";s:1:"1";s:2:"cm";s:1:"9";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"1";s:9:"sectionid";s:1:"5";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194480";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:35:"Introduction To Cash Flow Statement";}i:10;O:8:"stdClass":10:{s:2:"id";s:1:"2";s:2:"cm";s:2:"10";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"1";s:9:"sectionid";s:1:"5";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194552";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:38:"Creating A Layout For Integrated Model";}i:7;O:8:"stdClass":10:{s:2:"id";s:1:"5";s:2:"cm";s:1:"7";s:3:"mod";s:4:"page";s:7:"section";s:1:"2";s:9:"sectionid";s:1:"6";s:6:"module";s:2:"13";s:5:"added";s:10:"1364194247";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:15:"Excel Shortcuts";}i:8;O:8:"stdClass":10:{s:2:"id";s:1:"6";s:2:"cm";s:1:"8";s:3:"mod";s:4:"page";s:7:"section";s:1:"2";s:9:"sectionid";s:1:"6";s:6:"module";s:2:"13";s:5:"added";s:10:"1364194313";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:30:"Referencing Framework In Excel";}i:11;O:8:"stdClass":10:{s:2:"id";s:1:"3";s:2:"cm";s:2:"11";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"2";s:9:"sectionid";s:1:"6";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194634";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:15:"Excel Shortcuts";}i:12;O:8:"stdClass":10:{s:2:"id";s:1:"4";s:2:"cm";s:2:"12";s:3:"mod";s:4:"quiz";s:7:"section";s:1:"2";s:9:"sectionid";s:1:"6";s:6:"module";s:2:"14";s:5:"added";s:10:"1364194668";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:30:"Referencing Framework In Excel";}}', 5, 1364063400, 2, 0, 83886080, 0, 0, 1, 1, 0, 0, 0, 0, '', '', 1364029690, 1364194083, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_allowed_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_allowed_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courallomodu_cou_ix` (`course`),
  KEY `mdl_courallomodu_mod_ix` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='allowed modules foreach course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursecount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 2, 1, 1, 1364029010, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timenotified` bigint(10) unsigned DEFAULT NULL,
  `timeenrolled` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestarted` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  `reaggregate` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned DEFAULT NULL,
  `method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) unsigned DEFAULT NULL,
  `courseinstance` bigint(10) unsigned DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT NULL,
  `timeend` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_notify`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_notify` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `role` bigint(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timesent` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courcompnoti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion notification emails' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_display`
--

CREATE TABLE IF NOT EXISTS `mdl_course_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courdisp_couuse_ix` (`course`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about how to display the course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) unsigned NOT NULL DEFAULT '0',
  `completion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) unsigned DEFAULT NULL,
  `completionview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(3, 2, 13, 1, 15, '', 1364039645, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(4, 2, 13, 2, 15, '', 1364039722, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(5, 3, 13, 3, 5, '', 1364193857, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(6, 3, 13, 4, 5, '', 1364193891, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(7, 3, 13, 5, 6, '', 1364194247, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(8, 3, 13, 6, 6, '', 1364194313, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(9, 3, 14, 1, 5, '', 1364194480, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(10, 3, 14, 2, 5, '', 1364194552, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(11, 3, 14, 3, 6, '', 1364194634, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(12, 3, 14, 4, 6, '', 1364194668, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(13, 2, 14, 5, 15, '', 1364194888, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(14, 2, 14, 6, 15, '', 1364194925, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(15, 2, 13, 7, 16, '', 1364196575, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(16, 2, 13, 8, 16, '', 1364196624, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(17, 2, 14, 7, 16, '', 1364196670, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(18, 2, 14, 8, 16, '', 1364196699, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(19, 2, 18, 1, 15, '', 1364196954, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(20, 2, 18, 2, 15, '', 1364197106, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(21, 2, 18, 3, 16, '', 1364197208, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(22, 2, 18, 4, 16, '', 1364197243, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `sourcecmid` bigint(10) unsigned DEFAULT NULL,
  `requiredcompletion` tinyint(1) unsigned DEFAULT NULL,
  `gradeitemid` bigint(10) unsigned DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `completionstate` tinyint(1) unsigned NOT NULL,
  `viewed` tinyint(1) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timepublished` bigint(10) unsigned NOT NULL,
  `enrollable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `timechecked` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `requester` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` text,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sequence` text,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_coursect_cousec_ix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`) VALUES
(1, 1, 1, NULL, '', 1, '', 1),
(2, 2, 0, NULL, NULL, 1, '', 1),
(3, 3, 0, NULL, NULL, 1, '', 1),
(4, 1, 0, NULL, '', 1, '', 1),
(5, 3, 1, 'Some Section', '', 1, '6,5,9,10', 1),
(6, 3, 2, 'Another Section', '', 1, '7,8,11,12', 1),
(7, 3, 3, NULL, '', 1, NULL, 1),
(8, 3, 4, NULL, '', 1, NULL, 1),
(9, 3, 5, NULL, '', 1, NULL, 1),
(10, 3, 6, NULL, '', 1, NULL, 1),
(11, 3, 7, NULL, '', 1, NULL, 1),
(12, 3, 8, NULL, '', 1, NULL, 1),
(13, 3, 9, NULL, '', 1, NULL, 1),
(14, 3, 10, NULL, '', 1, NULL, 1),
(15, 2, 1, 'Some section', '', 1, '3,14,19,4,13,20', 1),
(16, 2, 2, 'Another Section', '', 1, '15,17,21,16,18,22', 1),
(17, 2, 3, 'yahoo', '', 1, NULL, 1),
(18, 2, 4, 'duck duck go', '', 1, NULL, 1),
(19, 2, 5, 'Archie', '', 1, NULL, 1),
(20, 2, 6, NULL, '', 1, NULL, 1),
(21, 2, 7, NULL, '', 1, NULL, 1),
(22, 2, 8, NULL, '', 1, NULL, 1),
(23, 2, 9, NULL, '', 1, NULL, 1),
(24, 2, 10, NULL, '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `comments` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requiredentries` int(8) unsigned NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) unsigned NOT NULL DEFAULT '0',
  `maxentries` int(8) unsigned NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `singletemplate` text,
  `listtemplate` text,
  `listtemplateheader` text,
  `listtemplatefooter` text,
  `addtemplate` text,
  `rsstemplate` text,
  `rsstitletemplate` text,
  `csstemplate` text,
  `jstemplate` text,
  `asearchtemplate` text,
  `approval` smallint(4) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) unsigned NOT NULL DEFAULT '0',
  `editany` smallint(4) unsigned NOT NULL DEFAULT '0',
  `notification` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recordid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `param1` text,
  `param2` text,
  `param3` text,
  `param4` text,
  `param5` text,
  `param6` text,
  `param7` text,
  `param8` text,
  `param9` text,
  `param10` text,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `approved` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT '0',
  `enrolstartdate` bigint(10) unsigned DEFAULT '0',
  `enrolenddate` bigint(10) unsigned DEFAULT '0',
  `expirynotify` tinyint(1) unsigned DEFAULT '0',
  `expirythreshold` bigint(10) unsigned DEFAULT '0',
  `notifyall` tinyint(1) unsigned DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) unsigned DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customchar1`, `customchar2`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1364029320, 1364029320),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1364029320, 1364194792),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1364029320, 1364029320),
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1364029691, 1364029691),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1364029691, 1364194083),
(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1364029691, 1364029691);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ccname` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `transid` bigint(20) unsigned DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `repeatid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeduration` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `sequence` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` mediumtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `internal` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfolio.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(3, 'role_assigned', 'mod_forum', '/mod/forum/lib.php', 's:24:"forum_user_role_assigned";', 'instant', 0, 1),
(4, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(5, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(6, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(7, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(8, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(9, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(10, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(11, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(12, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(13, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(14, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(15, 'user_enrol_modified', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:19:"user_enrol_modified";}', 'instant', 0, 1),
(16, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(17, 'user_deleted', 'portfolio_googledocs', '/portfolio/googledocs/lib.php', 's:33:"portfolio_googledocs_user_deleted";', 'cron', 0, 0),
(18, 'user_deleted', 'portfolio_picasa', '/portfolio/picasa/lib.php', 's:29:"portfolio_picasa_user_deleted";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` mediumtext,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) unsigned NOT NULL,
  `handlerid` bigint(10) unsigned NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` mediumtext,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=51 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(2, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(3, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(4, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(5, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(6, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(7, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(8, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(16, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(17, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(18, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(19, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(20, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(21, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(22, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(23, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(24, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(25, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(26, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(27, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(28, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(29, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(30, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(31, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(32, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(33, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(34, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(35, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(36, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(37, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(38, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(39, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(40, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(41, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(42, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(43, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(44, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(45, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(46, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(47, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(48, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(49, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(50, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) unsigned NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1364029014, NULL, 'moodle_mobile_app', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `creatorid` bigint(20) unsigned NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `lastaccess` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` text NOT NULL,
  `page_after_submitformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` text NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` smallint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dependitem` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned DEFAULT NULL,
  `filesize` bigint(10) unsigned NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `source` text,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'filter/activitynames', 1, -9999, 1),
(2, 'filter/algebra', 1, -9999, 2),
(3, 'filter/urltolink', 1, -9999, 3),
(4, 'filter/data', 1, -9999, 4),
(5, 'filter/emoticon', 1, -9999, 5),
(6, 'filter/emailprotect', 1, -9999, 6),
(7, 'filter/glossary', 1, -9999, 7),
(8, 'filter/tidy', 1, -9999, 8),
(9, 'filter/multilang', 1, -9999, 9),
(10, 'filter/mediaplugin', 1, -9999, 10),
(11, 'filter/tex', 1, -9999, 11),
(12, 'filter/censor', 1, -9999, 12);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) unsigned NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `warnafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) unsigned NOT NULL DEFAULT '0',
  `completionreplies` int(9) unsigned NOT NULL DEFAULT '0',
  `completionposts` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstread` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastread` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showall` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `globalglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `entbypage` smallint(3) unsigned NOT NULL DEFAULT '10',
  `editalways` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionentries` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` text NOT NULL,
  `definitionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `approved` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(1, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 1364039645, 1364196699, 0),
(2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 1364193857, 1364194669, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1364039645, 2, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1364039645, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(3, 1, 2, 'system', 1364193857, 2, 3, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(4, 2, 2, 'system', 1364193857, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(5, 2, 2, NULL, 1364194481, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(6, 2, 2, NULL, 1364194552, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(7, 2, 2, NULL, 1364194634, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(8, 2, 2, NULL, 1364194669, 2, 3, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(9, 2, 1, NULL, 1364194889, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(10, 2, 1, NULL, 1364194925, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(11, 2, 1, NULL, 1364196671, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(12, 2, 1, NULL, 1364196699, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `newgradeitem` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` mediumtext,
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(1, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1364039645, 1364196699),
(2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1364193857, 1364194669),
(3, 3, 2, 'Introduction To Cash Flow Statement', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1364194481, 1364194481),
(4, 3, 2, 'Creating A Layout For Integrated Model', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, NULL, 0, 0, 0, 0, 1364194552, 1364194552),
(5, 3, 2, 'Excel Shortcuts', 'mod', 'quiz', 3, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, NULL, 0, 0, 0, 0, 1364194634, 1364194634),
(6, 3, 2, 'Referencing Framework In Excel', 'mod', 'quiz', 4, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, NULL, 0, 0, 0, 0, 1364194669, 1364194669),
(7, 2, 1, 'Bond Indenture, Affirmative and Negative Convenants', 'mod', 'quiz', 5, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1364194889, 1364194889),
(8, 2, 1, 'Bond Features, Coupon Structures, Floating Rate Securities', 'mod', 'quiz', 6, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, NULL, 0, 0, 0, 0, 1364194925, 1364194925),
(9, 2, 1, 'Description of CFAI Professional Conduct Program', 'mod', 'quiz', 7, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, NULL, 0, 0, 0, 0, 1364196671, 1364196671),
(10, 2, 1, 'Basics of Code of Ethics and Professional Standards', 'mod', 'quiz', 8, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, NULL, 0, 0, 0, 0, 1364196699, 1364196699);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=27 ;

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1364039645, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(2, 1, 2, 'system', 1364193857, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(3, 1, 3, NULL, 1364194481, 2, 3, 2, 'Introduction To Cash Flow Statement', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(4, 2, 3, NULL, 1364194481, 2, 3, 2, 'Introduction To Cash Flow Statement', 'mod', 'quiz', 1, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(5, 2, 2, NULL, 1364194481, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(6, 1, 4, NULL, 1364194552, 2, 3, 2, 'Creating A Layout For Integrated Model', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(7, 2, 4, NULL, 1364194552, 2, 3, 2, 'Creating A Layout For Integrated Model', 'mod', 'quiz', 2, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(8, 2, 2, NULL, 1364194552, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(9, 1, 5, NULL, 1364194634, 2, 3, 2, 'Excel Shortcuts', 'mod', 'quiz', 3, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, 0, 0, 1, 0, NULL),
(10, 2, 5, NULL, 1364194634, 2, 3, 2, 'Excel Shortcuts', 'mod', 'quiz', 3, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, 0, 0, 1, 0, NULL),
(11, 2, 2, NULL, 1364194634, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(12, 1, 6, NULL, 1364194669, 2, 3, 2, 'Referencing Framework In Excel', 'mod', 'quiz', 4, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, 0, 0, 1, 0, NULL),
(13, 2, 6, NULL, 1364194669, 2, 3, 2, 'Referencing Framework In Excel', 'mod', 'quiz', 4, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, 0, 0, 1, 0, NULL),
(14, 2, 2, NULL, 1364194669, 2, 3, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(15, 1, 7, NULL, 1364194889, 2, 2, 1, 'Bond Indenture, Affirmative and Negative Convenants', 'mod', 'quiz', 5, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(16, 2, 7, NULL, 1364194889, 2, 2, 1, 'Bond Indenture, Affirmative and Negative Convenants', 'mod', 'quiz', 5, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(17, 2, 1, NULL, 1364194889, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(18, 1, 8, NULL, 1364194925, 2, 2, 1, 'Bond Features, Coupon Structures, Floating Rate Securities', 'mod', 'quiz', 6, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(19, 2, 8, NULL, 1364194925, 2, 2, 1, 'Bond Features, Coupon Structures, Floating Rate Securities', 'mod', 'quiz', 6, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(20, 2, 1, NULL, 1364194925, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(21, 1, 9, NULL, 1364196671, 2, 2, 1, 'Description of CFAI Professional Conduct Program', 'mod', 'quiz', 7, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, 0, 0, 1, 0, NULL),
(22, 2, 9, NULL, 1364196671, 2, 2, 1, 'Description of CFAI Professional Conduct Program', 'mod', 'quiz', 7, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, 0, 0, 1, 0, NULL),
(23, 2, 1, NULL, 1364196671, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(24, 1, 10, NULL, 1364196699, 2, 2, 1, 'Basics of Code of Ethics and Professional Standards', 'mod', 'quiz', 8, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, 0, 0, 1, 0, NULL),
(25, 2, 10, NULL, 1364196699, 2, 2, 1, 'Basics of Code of Ethics and Professional Standards', 'mod', 'quiz', 8, 0, NULL, '', NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 5, 0, 0, 0, 1, 0, NULL),
(26, 2, 1, NULL, 1364196699, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `outcomeid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `criterionid` bigint(10) unsigned NOT NULL,
  `levelid` bigint(10) unsigned DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) unsigned NOT NULL,
  `score` decimal(10,5) unsigned NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) unsigned NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `usercreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `usermodified` bigint(10) unsigned NOT NULL,
  `timecopied` bigint(10) unsigned DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) unsigned NOT NULL,
  `raterid` bigint(10) unsigned NOT NULL,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `rawgrade` decimal(10,5) unsigned DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `configdata` text,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` mediumtext,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) unsigned NOT NULL DEFAULT '0',
  `modattempts` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ongoing` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) unsigned NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) unsigned NOT NULL DEFAULT '5',
  `review` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL DEFAULT '0',
  `feedback` smallint(3) unsigned NOT NULL DEFAULT '1',
  `minquestions` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxpages` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retake` smallint(3) unsigned NOT NULL DEFAULT '1',
  `activitylink` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) unsigned NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) unsigned NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) unsigned NOT NULL DEFAULT '0',
  `slideshow` smallint(3) unsigned NOT NULL DEFAULT '0',
  `width` bigint(10) unsigned NOT NULL DEFAULT '640',
  `height` bigint(10) unsigned NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) unsigned NOT NULL DEFAULT '0',
  `progressbar` smallint(3) unsigned NOT NULL DEFAULT '0',
  `highscores` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) unsigned NOT NULL DEFAULT '0',
  `available` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deadline` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text,
  `answerformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `response` text,
  `responseformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answerid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` smallint(3) unsigned NOT NULL DEFAULT '0',
  `correct` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useranswer` text,
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradeid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `qtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qoption` smallint(3) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(3) unsigned NOT NULL DEFAULT '1',
  `display` smallint(3) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` text NOT NULL,
  `contentsformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `starttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lessontime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` text,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=196 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1364029233, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1364029269, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1364029320, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'CFA Level 1 (ID 2)'),
(4, 1364029344, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1364029691, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=3', 'Financial Modeling (ID 3)'),
(6, 1364032032, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1364037304, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(8, 1364037306, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(9, 1364037325, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(10, 1364037327, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(11, 1364037370, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(12, 1364037370, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(13, 1364037384, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(14, 1364037419, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(15, 1364037420, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(16, 1364037438, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(17, 1364037457, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(18, 1364037458, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(19, 1364037467, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(20, 1364037468, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(21, 1364037519, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=15', '1'),
(22, 1364037520, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(23, 1364037531, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(24, 1364037536, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(25, 1364037551, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=16', '2'),
(26, 1364037552, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(27, 1364037565, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(28, 1364037570, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(29, 1364037613, 2, '127.0.0.1', 3, 'course', 0, 'update', 'edit.php?id=3', '3'),
(30, 1364037614, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(31, 1364037621, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=17', '3'),
(32, 1364037622, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(33, 1364037651, 2, '127.0.0.1', 2, 'course', 0, 'update', 'edit.php?id=2', '2'),
(34, 1364037651, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(35, 1364037673, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=18', '4'),
(36, 1364037674, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(37, 1364037713, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=19', '5'),
(38, 1364037714, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(39, 1364039645, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/page/view.php?id=3', 'page 1'),
(40, 1364039645, 2, '127.0.0.1', 2, 'page', 3, 'add', 'view.php?id=3', '1'),
(41, 1364039646, 2, '127.0.0.1', 2, 'page', 3, 'view', 'view.php?id=3', '1'),
(42, 1364039722, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/page/view.php?id=4', 'page 2'),
(43, 1364039722, 2, '127.0.0.1', 2, 'page', 4, 'add', 'view.php?id=4', '2'),
(44, 1364039723, 2, '127.0.0.1', 2, 'page', 4, 'view', 'view.php?id=4', '2'),
(45, 1364039733, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(46, 1364039779, 2, '127.0.0.1', 2, 'course', 0, 'update mod', '../mod/page/view.php?id=3', 'page 1'),
(47, 1364039779, 2, '127.0.0.1', 2, 'page', 3, 'update', 'view.php?id=3', '1'),
(48, 1364039779, 2, '127.0.0.1', 2, 'page', 3, 'view', 'view.php?id=3', '1'),
(49, 1364189992, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'demo'),
(50, 1364190084, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(51, 1364190094, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(52, 1364190311, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(53, 1364191943, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(54, 1364191945, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(55, 1364191956, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(56, 1364191957, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(57, 1364193621, 2, '127.0.0.1', 3, 'course', 1, 'delete mod', 'view.php?id=3', 'forum 1'),
(58, 1364193857, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/page/view.php?id=5', 'page 3'),
(59, 1364193857, 2, '127.0.0.1', 3, 'page', 5, 'add', 'view.php?id=5', '3'),
(60, 1364193858, 2, '127.0.0.1', 3, 'page', 5, 'view', 'view.php?id=5', '3'),
(61, 1364193891, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/page/view.php?id=6', 'page 4'),
(62, 1364193892, 2, '127.0.0.1', 3, 'page', 6, 'add', 'view.php?id=6', '4'),
(63, 1364193892, 2, '127.0.0.1', 3, 'page', 6, 'view', 'view.php?id=6', '4'),
(64, 1364193900, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(65, 1364193993, 2, '127.0.0.1', 3, 'page', 6, 'view', 'view.php?id=6', '4'),
(66, 1364193996, 2, '127.0.0.1', 3, 'page', 5, 'view', 'view.php?id=5', '3'),
(67, 1364194037, 2, '127.0.0.1', 3, 'course', 0, 'editsection', 'editsection.php?id=5', '1'),
(68, 1364194037, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(69, 1364194056, 2, '127.0.0.1', 3, 'course', 0, 'editsection', 'editsection.php?id=6', '2'),
(70, 1364194057, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(71, 1364194083, 2, '127.0.0.1', 3, 'course', 0, 'update', 'edit.php?id=3', '3'),
(72, 1364194083, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(73, 1364194122, 2, '127.0.0.1', 3, 'course', 0, 'update mod', '../mod/page/view.php?id=5', 'page 3'),
(74, 1364194122, 2, '127.0.0.1', 3, 'page', 5, 'update', 'view.php?id=5', '3'),
(75, 1364194123, 2, '127.0.0.1', 3, 'page', 5, 'view', 'view.php?id=5', '3'),
(76, 1364194150, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(77, 1364194247, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/page/view.php?id=7', 'page 5'),
(78, 1364194247, 2, '127.0.0.1', 3, 'page', 7, 'add', 'view.php?id=7', '5'),
(79, 1364194248, 2, '127.0.0.1', 3, 'page', 7, 'view', 'view.php?id=7', '5'),
(80, 1364194259, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(81, 1364194313, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/page/view.php?id=8', 'page 6'),
(82, 1364194313, 2, '127.0.0.1', 3, 'page', 8, 'add', 'view.php?id=8', '6'),
(83, 1364194313, 2, '127.0.0.1', 3, 'page', 8, 'view', 'view.php?id=8', '6'),
(84, 1364194329, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(85, 1364194417, 2, '127.0.0.1', 3, 'page', 6, 'view', 'view.php?id=6', '4'),
(86, 1364194481, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=9', 'quiz 1'),
(87, 1364194481, 2, '127.0.0.1', 3, 'quiz', 9, 'add', 'view.php?id=9', '1'),
(88, 1364194482, 2, '127.0.0.1', 3, 'quiz', 9, 'view', 'view.php?id=9', '1'),
(89, 1364194488, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(90, 1364194494, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(91, 1364194517, 2, '127.0.0.1', 3, 'page', 5, 'view', 'view.php?id=5', '3'),
(92, 1364194552, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=10', 'quiz 2'),
(93, 1364194552, 2, '127.0.0.1', 3, 'quiz', 10, 'add', 'view.php?id=10', '2'),
(94, 1364194553, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(95, 1364194603, 2, '127.0.0.1', 3, 'page', 7, 'view', 'view.php?id=7', '5'),
(96, 1364194605, 2, '127.0.0.1', 3, 'page', 8, 'view', 'view.php?id=8', '6'),
(97, 1364194634, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=11', 'quiz 3'),
(98, 1364194634, 2, '127.0.0.1', 3, 'quiz', 11, 'add', 'view.php?id=11', '3'),
(99, 1364194635, 2, '127.0.0.1', 3, 'quiz', 11, 'view', 'view.php?id=11', '3'),
(100, 1364194643, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(101, 1364194669, 2, '127.0.0.1', 3, 'course', 0, 'add mod', '../mod/quiz/view.php?id=12', 'quiz 4'),
(102, 1364194669, 2, '127.0.0.1', 3, 'quiz', 12, 'add', 'view.php?id=12', '4'),
(103, 1364194669, 2, '127.0.0.1', 3, 'quiz', 12, 'view', 'view.php?id=12', '4'),
(104, 1364194691, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(105, 1364194724, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(106, 1364194737, 2, '127.0.0.1', 2, 'course', 2, 'delete mod', 'view.php?id=2', 'forum 2'),
(107, 1364194747, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=15', '1'),
(108, 1364194748, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(109, 1364194773, 2, '127.0.0.1', 2, 'course', 0, 'editsection', 'editsection.php?id=16', '2'),
(110, 1364194773, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(111, 1364194792, 2, '127.0.0.1', 2, 'course', 0, 'update', 'edit.php?id=2', '2'),
(112, 1364194793, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(113, 1364194851, 2, '127.0.0.1', 2, 'page', 3, 'view', 'view.php?id=3', '1'),
(114, 1364194853, 2, '127.0.0.1', 2, 'page', 4, 'view', 'view.php?id=4', '2'),
(115, 1364194889, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/quiz/view.php?id=13', 'quiz 5'),
(116, 1364194889, 2, '127.0.0.1', 2, 'quiz', 13, 'add', 'view.php?id=13', '5'),
(117, 1364194889, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(118, 1364194925, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/quiz/view.php?id=14', 'quiz 6'),
(119, 1364194925, 2, '127.0.0.1', 2, 'quiz', 14, 'add', 'view.php?id=14', '6'),
(120, 1364194926, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(121, 1364196138, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(122, 1364196139, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(123, 1364196148, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(124, 1364196148, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(125, 1364196575, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/page/view.php?id=15', 'page 7'),
(126, 1364196575, 2, '127.0.0.1', 2, 'page', 15, 'add', 'view.php?id=15', '7'),
(127, 1364196576, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(128, 1364196624, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/page/view.php?id=16', 'page 8'),
(129, 1364196624, 2, '127.0.0.1', 2, 'page', 16, 'add', 'view.php?id=16', '8'),
(130, 1364196625, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(131, 1364196634, 2, '127.0.0.1', 2, 'page', 15, 'view', 'view.php?id=15', '7'),
(132, 1364196636, 2, '127.0.0.1', 2, 'page', 16, 'view', 'view.php?id=16', '8'),
(133, 1364196671, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/quiz/view.php?id=17', 'quiz 7'),
(134, 1364196671, 2, '127.0.0.1', 2, 'quiz', 17, 'add', 'view.php?id=17', '7'),
(135, 1364196672, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(136, 1364196699, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/quiz/view.php?id=18', 'quiz 8'),
(137, 1364196699, 2, '127.0.0.1', 2, 'quiz', 18, 'add', 'view.php?id=18', '8'),
(138, 1364196700, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(139, 1364196813, 2, '127.0.0.1', 2, 'page', 3, 'view', 'view.php?id=3', '1'),
(140, 1364196815, 2, '127.0.0.1', 2, 'page', 4, 'view', 'view.php?id=4', '2'),
(141, 1364196954, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/url/view.php?id=19', 'url 1'),
(142, 1364196954, 2, '127.0.0.1', 2, 'url', 19, 'add', 'view.php?id=19', '1'),
(143, 1364196955, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(144, 1364197058, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(145, 1364197077, 2, '127.0.0.1', 2, 'quiz', 13, 'view', 'view.php?id=13', '5'),
(146, 1364197106, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/url/view.php?id=20', 'url 2'),
(147, 1364197106, 2, '127.0.0.1', 2, 'url', 20, 'add', 'view.php?id=20', '2'),
(148, 1364197107, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(149, 1364197137, 2, '127.0.0.1', 2, 'course', 0, 'update mod', '../mod/url/view.php?id=20', 'url 2'),
(150, 1364197137, 2, '127.0.0.1', 2, 'url', 20, 'update', 'view.php?id=20', '2'),
(151, 1364197138, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(152, 1364197163, 2, '127.0.0.1', 2, 'quiz', 17, 'view', 'view.php?id=17', '7'),
(153, 1364197166, 2, '127.0.0.1', 2, 'quiz', 18, 'view', 'view.php?id=18', '8'),
(154, 1364197208, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/url/view.php?id=21', 'url 3'),
(155, 1364197208, 2, '127.0.0.1', 2, 'url', 21, 'add', 'view.php?id=21', '3'),
(156, 1364197209, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(157, 1364197243, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/url/view.php?id=22', 'url 4'),
(158, 1364197243, 2, '127.0.0.1', 2, 'url', 22, 'add', 'view.php?id=22', '4'),
(159, 1364197243, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(160, 1364197248, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(161, 1364197269, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(162, 1364197553, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(163, 1364197554, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(164, 1364197630, 2, '127.0.0.1', 1, 'user', 0, 'add', 'view.php?id=3&course=1', ''),
(165, 1364197695, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(166, 1364197700, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(167, 1364197886, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(168, 1364197889, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(169, 1364199844, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(170, 1364200574, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(171, 1364200577, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(172, 1364201641, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(173, 1364201643, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(174, 1364201668, 2, '127.0.0.1', 3, 'page', 6, 'view', 'view.php?id=6', '4'),
(175, 1364201699, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(176, 1364201845, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(177, 1364201861, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'pristine'),
(178, 1364201917, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '3'),
(179, 1364201918, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(180, 1364201929, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(181, 1364201933, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(182, 1364202292, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(183, 1364202302, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(184, 1364202349, 3, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(185, 1364202429, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(186, 1364202577, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(187, 1364202579, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(188, 1364202802, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(189, 1364202855, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(190, 1364202955, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(191, 1364203151, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(192, 1364203174, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(193, 1364203219, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(194, 1364203234, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(195, 1364203244, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=145 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(3, 'course', 'view', 'course', 'fullname', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(6, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(7, 'course', 'report log', 'course', 'fullname', 'moodle'),
(8, 'course', 'report live', 'course', 'fullname', 'moodle'),
(9, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(10, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(11, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(12, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(13, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(14, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(15, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(16, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(17, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(18, 'group', 'view', 'groups', 'name', 'moodle'),
(19, 'tag', 'update', 'tag', 'name', 'moodle'),
(20, 'tag', 'flag', 'tag', 'name', 'moodle'),
(21, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(22, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(23, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(24, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(25, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(26, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(27, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(28, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(29, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(30, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(31, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(32, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(33, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(34, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(35, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(36, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(37, 'data', 'view', 'data', 'name', 'mod_data'),
(38, 'data', 'add', 'data', 'name', 'mod_data'),
(39, 'data', 'update', 'data', 'name', 'mod_data'),
(40, 'data', 'record delete', 'data', 'name', 'mod_data'),
(41, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(42, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(43, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(44, 'data', 'templates def', 'data', 'name', 'mod_data'),
(45, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(46, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(47, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(48, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(49, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(50, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(51, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(52, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(53, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(54, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(55, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(56, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(57, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(58, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(59, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(60, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(61, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(62, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(63, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(64, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(65, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(66, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(67, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(68, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(69, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(70, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(71, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(72, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(73, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(74, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(75, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(76, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(77, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(78, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(79, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(80, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(81, 'label', 'add', 'label', 'name', 'mod_label'),
(82, 'label', 'update', 'label', 'name', 'mod_label'),
(83, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(84, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(85, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(86, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(87, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(88, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(89, 'page', 'view', 'page', 'name', 'mod_page'),
(90, 'page', 'view all', 'page', 'name', 'mod_page'),
(91, 'page', 'update', 'page', 'name', 'mod_page'),
(92, 'page', 'add', 'page', 'name', 'mod_page'),
(93, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(94, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(95, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(96, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(97, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(98, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(99, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(100, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(101, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(102, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(103, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(104, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(105, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(106, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(107, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(108, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(109, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(110, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(111, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(112, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(113, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(114, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(115, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(116, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(117, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(118, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(119, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(120, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(121, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(122, 'url', 'view', 'url', 'name', 'mod_url'),
(123, 'url', 'view all', 'url', 'name', 'mod_url'),
(124, 'url', 'update', 'url', 'name', 'mod_url'),
(125, 'url', 'add', 'url', 'name', 'mod_url'),
(126, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(127, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(128, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(129, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(130, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(131, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(132, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(133, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(134, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(135, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(136, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(137, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(138, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(139, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(140, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(141, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(142, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(143, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(144, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) unsigned NOT NULL,
  `sqltext` mediumtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `info` text,
  `backtrace` text,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `typeid` bigint(10) unsigned DEFAULT NULL,
  `toolurl` text NOT NULL,
  `securetoolurl` text,
  `instructorchoicesendname` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) unsigned DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) unsigned DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) unsigned DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` text,
  `secureicon` text,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `datesubmitted` bigint(10) unsigned NOT NULL,
  `dateupdated` bigint(10) unsigned NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) unsigned NOT NULL,
  `state` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` text NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `course` bigint(10) unsigned NOT NULL,
  `coursevisible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text,
  `fullmessage` text,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext,
  `smallmessage` text,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text,
  `contexturlname` text,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'instantmessage', 'moodle', NULL),
(4, 'backup', 'moodle', 'moodle/site:config'),
(5, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(6, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(7, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(8, 'assignment_updates', 'mod_assignment', NULL),
(9, 'submission', 'mod_feedback', NULL),
(10, 'message', 'mod_feedback', NULL),
(11, 'posts', 'mod_forum', NULL),
(12, 'graded_essay', 'mod_lesson', NULL),
(13, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(14, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(15, 'authorize_enrolment', 'enrol_authorize', NULL),
(16, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(17, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(18, 'paypal_enrolment', 'enrol_paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useridto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` text,
  `fullmessage` text,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext,
  `smallmessage` text,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text,
  `contexturlname` text,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) unsigned NOT NULL,
  `processorid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `remoteid` bigint(10) unsigned NOT NULL,
  `categoryid` bigint(10) unsigned NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` mediumtext NOT NULL,
  `summaryformat` smallint(3) unsigned DEFAULT '0',
  `startdate` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `remotecourseid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` mediumtext NOT NULL,
  `public_key_expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transport` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `portno` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `remoteid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `help` mediumtext NOT NULL,
  `profile` mediumtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assignment', 2011112901, 60, 0, '', 1),
(2, 'chat', 2011112900, 300, 0, '', 1),
(3, 'choice', 2011112900, 0, 0, '', 1),
(4, 'data', 2011112902, 0, 0, '', 1),
(5, 'feedback', 2011112900, 0, 0, '', 0),
(6, 'folder', 2011112900, 0, 0, '', 1),
(7, 'forum', 2011112901, 60, 0, '', 1),
(8, 'glossary', 2011112900, 0, 0, '', 1),
(9, 'imscp', 2011112900, 0, 0, '', 1),
(10, 'label', 2011112901, 0, 0, '', 1),
(11, 'lesson', 2011112901, 0, 0, '', 1),
(12, 'lti', 2011112900, 0, 0, '', 1),
(13, 'page', 2011112900, 0, 0, '', 1),
(14, 'quiz', 2011112904, 60, 0, '', 1),
(15, 'resource', 2011112900, 0, 0, '', 1),
(16, 'scorm', 2011112901, 300, 0, '', 1),
(17, 'survey', 2011112901, 0, 0, '', 1),
(18, 'url', 2011112900, 0, 0, '', 1),
(19, 'wiki', 2011112900, 0, 0, '', 1),
(20, 'workshop', 2011112902, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `contentformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_page`
--

INSERT INTO `mdl_page` (`id`, `course`, `name`, `intro`, `introformat`, `content`, `contentformat`, `legacyfiles`, `legacyfileslast`, `display`, `displayoptions`, `revision`, `timemodified`) VALUES
(1, 2, 'Bond Features, Coupon Structures, Floating Rate Securities', '<p>Bond Features, Coupon Structures, Floating Rate Securities</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Fixed%20Income/53_b/Video/53_b.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 2, 1364039779),
(2, 2, 'Bond Indenture, Affirmative and Negative Convenants', '<p>Bond Indenture, Affirmative and Negative Convenants</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Fixed%20Income/53_a/Video/53_a.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364039722),
(3, 3, 'Creating A Layout For Integrated Model', '<p>Creating A Layout For Integrated Model</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/CreatingALayout.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 2, 1364194122),
(4, 3, 'Introduction To Cash Flow Statement', '<p>Introduction To Cash Flow Statement</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-1/Creating%20A%20Layout%20For%20Integrated%20Model/CreatingALayout/CreatingALayout.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364193891),
(5, 3, 'Excel Shortcuts', '<p>Excel Shortcuts</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Excel%20Shortcuts/Video%20File/Excel-Shortcuts/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Excel%20Shortcuts/Video%20File/Excel-Shortcuts/Excel-Shortcuts.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364194247),
(6, 3, 'Referencing Framework In Excel', '<p>Referencing Framework In Excel</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" poster="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Referencing%20Framework%20In%20Excel/Video/Excel-Referencing/FirstFrame.png" data-setup="{}"> <source src="http://46b2883fe69f71a9d373-90b0271211f6c4393f9dc0e61fcff557.r75.cf2.rackcdn.com/Week-2/Referencing%20Framework%20In%20Excel/Video/Excel-Referencing/Excel-Referencing.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364194313),
(7, 2, 'Description of CFAI Professional Conduct Program', '<p><a title="Page" href="http://moodle.edupristine.com/mod/page/view.php?id=79" style="line-height: 1.231;">Description of CFAI Professional Conduct Program</a></p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Ethics/1_a/Video/1_a.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364196575),
(8, 2, 'Basics of Code of Ethics and Professional Standards', '<p>Basics of Code of Ethics and Professional Standards</p>', 1, '<p><video id="my_video_1" class="video-js vjs-default-skin" controls="controls" preload="auto" width="708" height="399" data-setup="{}"> <source src="http://fae752f5911b35bb7d4b-e992a08683363986de253f4115b68ac9.r73.cf2.rackcdn.com/Ethics/1_bc/Video/1_bc.mp4" type="video/mp4" /> </video></p>', 1, 0, NULL, 5, 'a:2:{s:12:"printheading";s:1:"1";s:10:"printintro";s:1:"0";}', 1, 1364196624);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `time` bigint(10) unsigned NOT NULL,
  `portfolio` bigint(10) unsigned NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) unsigned NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `moduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) unsigned NOT NULL DEFAULT '0',
  `format` bigint(10) unsigned NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) unsigned NOT NULL,
  `totalcputime` bigint(10) unsigned NOT NULL,
  `totalcalls` bigint(10) unsigned NOT NULL,
  `totalmemory` bigint(10) unsigned NOT NULL,
  `runreference` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` text,
  `graderinfoformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` text NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` text NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) unsigned NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned DEFAULT NULL,
  `modifiedby` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` text NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) unsigned NOT NULL,
  `variant` bigint(10) unsigned NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `questionsummary` text,
  `rightanswer` text,
  `responsesummary` text,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) unsigned NOT NULL,
  `sequencenumber` bigint(10) unsigned NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` text,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) unsigned NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `hint` text NOT NULL,
  `hintformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) unsigned DEFAULT NULL,
  `clearwrong` tinyint(1) unsigned DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_match`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subquestions` varchar(255) NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_match_sub`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match_sub` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questiontext` text NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sequence` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showunits` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) unsigned NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `choose` bigint(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newest` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newgraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` text NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_shortanswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_shortanswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `event` smallint(4) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` text NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timelimit` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Main information about each quiz' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_quiz`
--

INSERT INTO `mdl_quiz` (`id`, `course`, `name`, `intro`, `introformat`, `timeopen`, `timeclose`, `preferredbehaviour`, `attempts`, `attemptonlast`, `grademethod`, `decimalpoints`, `questiondecimalpoints`, `reviewattempt`, `reviewcorrectness`, `reviewmarks`, `reviewspecificfeedback`, `reviewgeneralfeedback`, `reviewrightanswer`, `reviewoverallfeedback`, `questionsperpage`, `shufflequestions`, `shuffleanswers`, `questions`, `sumgrades`, `grade`, `timecreated`, `timemodified`, `timelimit`, `password`, `subnet`, `browsersecurity`, `delay1`, `delay2`, `showuserpicture`, `showblocks`) VALUES
(1, 3, 'Introduction To Cash Flow Statement', '<p>Quiz related to the video titled</p>\r\n<p><span style="font-size: 1.5em; line-height: 1.231;">Itroduction To Cash Flow Statement</span></p>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194481, 0, '', '', '-', 0, 0, 0, 0),
(2, 3, 'Creating A Layout For Integrated Model', '<h2 id="pageheading" class="main">Creating A Layout For Integrated Model</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194552, 0, '', '', '-', 0, 0, 0, 0),
(3, 3, 'Excel Shortcuts', '<h2 id="pageheading" class="main">Excel Shortcuts</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194634, 0, '', '', '-', 0, 0, 0, 0),
(4, 3, 'Referencing Framework In Excel', '<h2 id="pageheading" class="main">Referencing Framework In Excel</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194668, 0, '', '', '-', 0, 0, 0, 0),
(5, 2, 'Bond Indenture, Affirmative and Negative Convenants', '<h2 id="pageheading" class="main">Bond Indenture, Affirmative and Negative Convenants</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194889, 0, '', '', '-', 0, 0, 0, 0),
(6, 2, 'Bond Features, Coupon Structures, Floating Rate Securities', '<h2 id="pageheading" class="main">Bond Features, Coupon Structures, Floating Rate Securities</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364194925, 0, '', '', '-', 0, 0, 0, 0),
(7, 2, 'Description of CFAI Professional Conduct Program', '<h2 id="pageheading" class="main">Description of CFAI Professional Conduct Program</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364196670, 0, '', '', '-', 0, 0, 0, 0),
(8, 2, 'Basics of Code of Ethics and Professional Standards', '<h2 id="pageheading" class="main">Basics of Code of Ethics and Professional Standards</h2>', 1, 0, 0, 'deferredfeedback', 0, 0, 1, 2, -1, 69904, 4368, 4368, 4368, 4368, 4368, 4368, 1, 0, 1, '', 0.00000, 100.00000, 0, 1364196699, 0, '', '', '-', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` text NOT NULL,
  `preview` smallint(3) unsigned NOT NULL DEFAULT '0',
  `needsupgradetonewqe` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores various attempts on a quiz' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedbacktext` text NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_quiz_feedback`
--

INSERT INTO `mdl_quiz_feedback` (`id`, `quizid`, `feedbacktext`, `feedbacktextformat`, `mingrade`, `maxgrade`) VALUES
(1, 1, '', 1, 0.00000, 101.00000),
(2, 2, '', 1, 0.00000, 101.00000),
(3, 3, '', 1, 0.00000, 101.00000),
(4, 4, '', 1, 0.00000, 101.00000),
(5, 5, '', 1, 0.00000, 101.00000),
(6, 6, '', 1, 0.00000, 101.00000),
(7, 7, '', 1, 0.00000, 101.00000),
(8, 8, '', 1, 0.00000, 101.00000);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overall grade for each user on the quiz, based on their ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timeopen` bigint(10) unsigned DEFAULT NULL,
  `timeclose` bigint(10) unsigned DEFAULT NULL,
  `timelimit` bigint(10) unsigned DEFAULT NULL,
  `attempts` mediumint(6) unsigned DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `subqid` bigint(10) unsigned NOT NULL,
  `aid` bigint(10) unsigned DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) unsigned DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `slot` bigint(10) unsigned DEFAULT NULL,
  `subquestion` smallint(4) unsigned NOT NULL,
  `s` bigint(10) unsigned NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` mediumtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` mediumtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) unsigned NOT NULL,
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `lastcron`, `cron`, `capability`) VALUES
(1, 'overview', 10000, 0, 0, NULL),
(2, 'responses', 9000, 0, 0, NULL),
(3, 'grading', 6000, 0, 0, NULL),
(4, 'statistics', 8000, 0, 18000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL,
  `groupid` bigint(10) unsigned NOT NULL,
  `allattempts` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstattemptscount` bigint(10) unsigned NOT NULL,
  `allattemptscount` bigint(10) unsigned NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned DEFAULT '1',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'user', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1364029084, 1364029084, 0),
(2, '', 2, 0, 1, NULL, NULL, 1364029084, 1364029084, 0),
(3, '', 3, 0, 1, NULL, NULL, 1364029085, 1364029085, 0),
(4, '', 4, 0, 1, NULL, NULL, 1364029085, 1364029085, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `filterfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `alltext` mediumtext NOT NULL,
  `popup` text NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `cmid` bigint(10) unsigned DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  `migrated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_nam_uix` (`name`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, 'Manager', 'manager', 'Managers can access course and modify them, they usually do not participate in courses.', 1, 'manager'),
(2, 'Course creator', 'coursecreator', 'Course creators can create new courses.', 2, 'coursecreator'),
(3, 'Teacher', 'editingteacher', 'Teachers can do anything within a course, including changing the activities and grading students.', 3, 'editingteacher'),
(4, 'Non-editing teacher', 'teacher', 'Non-editing teachers can teach in courses and grade students, but may not alter activities.', 4, 'teacher'),
(5, 'Student', 'student', 'Students generally have fewer privileges within a course.', 5, 'student'),
(6, 'Guest', 'guest', 'Guests have minimal privileges and usually can not enter text anywhere.', 6, 'guest'),
(7, 'Authenticated user', 'user', 'All logged in users.', 7, 'user'),
(8, 'Authenticated user on frontpage', 'frontpage', 'All logged in users in the frontpage course.', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowassign` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `allowswitch` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(1, 5, 15, 2, 1364029341, 2, '', 0, 0),
(2, 5, 20, 2, 1364029702, 2, '', 0, 0),
(3, 5, 15, 3, 1364197737, 2, '', 0, 0),
(4, 5, 20, 3, 1364197743, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=906 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1364029011, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1364029011, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1364029011, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1364029011, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1364029011, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1364029011, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1364029011, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1364029011, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1364029011, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1364029011, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1364029011, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1364029011, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1364029011, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1364029011, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1364029011, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1364029011, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1364029011, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1364029011, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1364029011, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1364029011, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1364029011, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1364029011, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1364029011, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1364029011, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1364029011, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1364029011, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1364029011, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1364029011, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1364029011, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1364029011, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1364029011, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1364029011, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1364029011, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1364029011, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1364029011, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1364029011, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1364029011, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1364029011, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1364029011, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1364029011, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1364029011, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1364029011, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1364029011, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1364029011, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1364029011, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1364029011, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1364029011, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1364029011, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1364029011, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1364029011, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1364029011, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1364029011, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1364029011, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1364029011, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1364029011, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1364029011, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1364029011, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1364029011, 0),
(59, 1, 1, 'moodle/user:create', 1, 1364029011, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1364029011, 0),
(61, 1, 1, 'moodle/user:update', 1, 1364029011, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1364029011, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1364029011, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1364029011, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1364029011, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1364029011, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1364029011, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1364029011, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1364029011, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1364029011, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1364029011, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1364029011, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1364029011, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1364029011, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1364029011, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1364029011, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1364029011, 0),
(78, 1, 4, 'moodle/role:review', 1, 1364029011, 0),
(79, 1, 3, 'moodle/role:review', 1, 1364029011, 0),
(80, 1, 1, 'moodle/role:review', 1, 1364029011, 0),
(81, 1, 1, 'moodle/role:override', 1, 1364029011, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1364029011, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1364029011, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1364029011, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1364029011, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1364029011, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1364029011, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1364029011, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1364029011, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1364029011, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1364029011, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1364029011, 0),
(93, 1, 2, 'moodle/course:create', 1, 1364029011, 0),
(94, 1, 1, 'moodle/course:create', 1, 1364029011, 0),
(95, 1, 7, 'moodle/course:request', 1, 1364029011, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1364029011, 0),
(97, 1, 3, 'moodle/course:update', 1, 1364029011, 0),
(98, 1, 1, 'moodle/course:update', 1, 1364029011, 0),
(99, 1, 1, 'moodle/course:view', 1, 1364029011, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1364029011, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1364029012, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1364029012, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1364029012, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1364029012, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1364029012, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1364029012, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1364029012, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1364029012, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1364029012, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1364029012, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1364029012, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1364029012, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1364029012, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1364029012, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1364029012, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1364029012, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1364029012, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1364029012, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1364029012, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1364029012, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1364029012, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1364029012, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1364029012, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1364029012, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1364029012, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1364029012, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1364029012, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1364029012, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1364029012, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1364029012, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1364029012, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1364029012, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1364029012, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1364029012, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1364029012, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1364029012, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1364029012, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1364029012, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1364029012, 0),
(140, 1, 5, 'moodle/course:viewscales', 1, 1364029012, 0),
(141, 1, 4, 'moodle/course:viewscales', 1, 1364029012, 0),
(142, 1, 3, 'moodle/course:viewscales', 1, 1364029012, 0),
(143, 1, 1, 'moodle/course:viewscales', 1, 1364029012, 0),
(144, 1, 3, 'moodle/course:managescales', 1, 1364029012, 0),
(145, 1, 1, 'moodle/course:managescales', 1, 1364029012, 0),
(146, 1, 3, 'moodle/course:managegroups', 1, 1364029012, 0),
(147, 1, 1, 'moodle/course:managegroups', 1, 1364029012, 0),
(148, 1, 3, 'moodle/course:reset', 1, 1364029012, 0),
(149, 1, 1, 'moodle/course:reset', 1, 1364029012, 0),
(150, 1, 6, 'moodle/blog:view', 1, 1364029012, 0),
(151, 1, 7, 'moodle/blog:view', 1, 1364029012, 0),
(152, 1, 5, 'moodle/blog:view', 1, 1364029012, 0),
(153, 1, 4, 'moodle/blog:view', 1, 1364029012, 0),
(154, 1, 3, 'moodle/blog:view', 1, 1364029012, 0),
(155, 1, 1, 'moodle/blog:view', 1, 1364029012, 0),
(156, 1, 6, 'moodle/blog:search', 1, 1364029012, 0),
(157, 1, 7, 'moodle/blog:search', 1, 1364029012, 0),
(158, 1, 5, 'moodle/blog:search', 1, 1364029012, 0),
(159, 1, 4, 'moodle/blog:search', 1, 1364029012, 0),
(160, 1, 3, 'moodle/blog:search', 1, 1364029012, 0),
(161, 1, 1, 'moodle/blog:search', 1, 1364029012, 0),
(162, 1, 1, 'moodle/blog:viewdrafts', 1, 1364029012, 0),
(163, 1, 7, 'moodle/blog:create', 1, 1364029012, 0),
(164, 1, 1, 'moodle/blog:create', 1, 1364029012, 0),
(165, 1, 4, 'moodle/blog:manageentries', 1, 1364029012, 0),
(166, 1, 3, 'moodle/blog:manageentries', 1, 1364029012, 0),
(167, 1, 1, 'moodle/blog:manageentries', 1, 1364029012, 0),
(168, 1, 5, 'moodle/blog:manageexternal', 1, 1364029012, 0),
(169, 1, 7, 'moodle/blog:manageexternal', 1, 1364029012, 0),
(170, 1, 4, 'moodle/blog:manageexternal', 1, 1364029012, 0),
(171, 1, 3, 'moodle/blog:manageexternal', 1, 1364029012, 0),
(172, 1, 1, 'moodle/blog:manageexternal', 1, 1364029012, 0),
(173, 1, 5, 'moodle/blog:associatecourse', 1, 1364029012, 0),
(174, 1, 7, 'moodle/blog:associatecourse', 1, 1364029012, 0),
(175, 1, 4, 'moodle/blog:associatecourse', 1, 1364029012, 0),
(176, 1, 3, 'moodle/blog:associatecourse', 1, 1364029012, 0),
(177, 1, 1, 'moodle/blog:associatecourse', 1, 1364029012, 0),
(178, 1, 5, 'moodle/blog:associatemodule', 1, 1364029012, 0),
(179, 1, 7, 'moodle/blog:associatemodule', 1, 1364029012, 0),
(180, 1, 4, 'moodle/blog:associatemodule', 1, 1364029012, 0),
(181, 1, 3, 'moodle/blog:associatemodule', 1, 1364029012, 0),
(182, 1, 1, 'moodle/blog:associatemodule', 1, 1364029012, 0),
(183, 1, 7, 'moodle/calendar:manageownentries', 1, 1364029012, 0),
(184, 1, 1, 'moodle/calendar:manageownentries', 1, 1364029012, 0),
(185, 1, 4, 'moodle/calendar:managegroupentries', 1, 1364029012, 0),
(186, 1, 3, 'moodle/calendar:managegroupentries', 1, 1364029012, 0),
(187, 1, 1, 'moodle/calendar:managegroupentries', 1, 1364029012, 0),
(188, 1, 4, 'moodle/calendar:manageentries', 1, 1364029012, 0),
(189, 1, 3, 'moodle/calendar:manageentries', 1, 1364029012, 0),
(190, 1, 1, 'moodle/calendar:manageentries', 1, 1364029012, 0),
(191, 1, 1, 'moodle/user:editprofile', 1, 1364029012, 0),
(192, 1, 6, 'moodle/user:editownprofile', -1000, 1364029012, 0),
(193, 1, 7, 'moodle/user:editownprofile', 1, 1364029012, 0),
(194, 1, 1, 'moodle/user:editownprofile', 1, 1364029012, 0),
(195, 1, 6, 'moodle/user:changeownpassword', -1000, 1364029012, 0),
(196, 1, 7, 'moodle/user:changeownpassword', 1, 1364029012, 0),
(197, 1, 1, 'moodle/user:changeownpassword', 1, 1364029012, 0),
(198, 1, 5, 'moodle/user:readuserposts', 1, 1364029012, 0),
(199, 1, 4, 'moodle/user:readuserposts', 1, 1364029012, 0),
(200, 1, 3, 'moodle/user:readuserposts', 1, 1364029012, 0),
(201, 1, 1, 'moodle/user:readuserposts', 1, 1364029012, 0),
(202, 1, 5, 'moodle/user:readuserblogs', 1, 1364029012, 0),
(203, 1, 4, 'moodle/user:readuserblogs', 1, 1364029012, 0),
(204, 1, 3, 'moodle/user:readuserblogs', 1, 1364029012, 0),
(205, 1, 1, 'moodle/user:readuserblogs', 1, 1364029012, 0),
(206, 1, 1, 'moodle/user:editmessageprofile', 1, 1364029012, 0),
(207, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1364029012, 0),
(208, 1, 7, 'moodle/user:editownmessageprofile', 1, 1364029012, 0),
(209, 1, 1, 'moodle/user:editownmessageprofile', 1, 1364029012, 0),
(210, 1, 3, 'moodle/question:managecategory', 1, 1364029012, 0),
(211, 1, 1, 'moodle/question:managecategory', 1, 1364029012, 0),
(212, 1, 3, 'moodle/question:add', 1, 1364029012, 0),
(213, 1, 1, 'moodle/question:add', 1, 1364029012, 0),
(214, 1, 3, 'moodle/question:editmine', 1, 1364029012, 0),
(215, 1, 1, 'moodle/question:editmine', 1, 1364029012, 0),
(216, 1, 3, 'moodle/question:editall', 1, 1364029012, 0),
(217, 1, 1, 'moodle/question:editall', 1, 1364029012, 0),
(218, 1, 3, 'moodle/question:viewmine', 1, 1364029012, 0),
(219, 1, 1, 'moodle/question:viewmine', 1, 1364029013, 0),
(220, 1, 3, 'moodle/question:viewall', 1, 1364029013, 0),
(221, 1, 1, 'moodle/question:viewall', 1, 1364029013, 0),
(222, 1, 3, 'moodle/question:usemine', 1, 1364029013, 0),
(223, 1, 1, 'moodle/question:usemine', 1, 1364029013, 0),
(224, 1, 3, 'moodle/question:useall', 1, 1364029013, 0),
(225, 1, 1, 'moodle/question:useall', 1, 1364029013, 0),
(226, 1, 3, 'moodle/question:movemine', 1, 1364029013, 0),
(227, 1, 1, 'moodle/question:movemine', 1, 1364029013, 0),
(228, 1, 3, 'moodle/question:moveall', 1, 1364029013, 0),
(229, 1, 1, 'moodle/question:moveall', 1, 1364029013, 0),
(230, 1, 1, 'moodle/question:config', 1, 1364029013, 0),
(231, 1, 5, 'moodle/question:flag', 1, 1364029013, 0),
(232, 1, 4, 'moodle/question:flag', 1, 1364029013, 0),
(233, 1, 3, 'moodle/question:flag', 1, 1364029013, 0),
(234, 1, 1, 'moodle/question:flag', 1, 1364029013, 0),
(235, 1, 4, 'moodle/site:doclinks', 1, 1364029013, 0),
(236, 1, 3, 'moodle/site:doclinks', 1, 1364029013, 0),
(237, 1, 1, 'moodle/site:doclinks', 1, 1364029013, 0),
(238, 1, 3, 'moodle/course:sectionvisibility', 1, 1364029013, 0),
(239, 1, 1, 'moodle/course:sectionvisibility', 1, 1364029013, 0),
(240, 1, 3, 'moodle/course:useremail', 1, 1364029013, 0),
(241, 1, 1, 'moodle/course:useremail', 1, 1364029013, 0),
(242, 1, 3, 'moodle/course:viewhiddensections', 1, 1364029013, 0),
(243, 1, 1, 'moodle/course:viewhiddensections', 1, 1364029013, 0),
(244, 1, 3, 'moodle/course:setcurrentsection', 1, 1364029013, 0),
(245, 1, 1, 'moodle/course:setcurrentsection', 1, 1364029013, 0),
(246, 1, 4, 'moodle/grade:viewall', 1, 1364029013, 0),
(247, 1, 3, 'moodle/grade:viewall', 1, 1364029013, 0),
(248, 1, 1, 'moodle/grade:viewall', 1, 1364029013, 0),
(249, 1, 5, 'moodle/grade:view', 1, 1364029013, 0),
(250, 1, 4, 'moodle/grade:viewhidden', 1, 1364029013, 0),
(251, 1, 3, 'moodle/grade:viewhidden', 1, 1364029013, 0),
(252, 1, 1, 'moodle/grade:viewhidden', 1, 1364029013, 0),
(253, 1, 3, 'moodle/grade:import', 1, 1364029013, 0),
(254, 1, 1, 'moodle/grade:import', 1, 1364029013, 0),
(255, 1, 4, 'moodle/grade:export', 1, 1364029013, 0),
(256, 1, 3, 'moodle/grade:export', 1, 1364029013, 0),
(257, 1, 1, 'moodle/grade:export', 1, 1364029013, 0),
(258, 1, 3, 'moodle/grade:manage', 1, 1364029013, 0),
(259, 1, 1, 'moodle/grade:manage', 1, 1364029013, 0),
(260, 1, 3, 'moodle/grade:edit', 1, 1364029013, 0),
(261, 1, 1, 'moodle/grade:edit', 1, 1364029013, 0),
(262, 1, 3, 'moodle/grade:managegradingforms', 1, 1364029013, 0),
(263, 1, 1, 'moodle/grade:managegradingforms', 1, 1364029013, 0),
(264, 1, 1, 'moodle/grade:sharegradingforms', 1, 1364029013, 0),
(265, 1, 1, 'moodle/grade:managesharedforms', 1, 1364029013, 0),
(266, 1, 3, 'moodle/grade:manageoutcomes', 1, 1364029013, 0),
(267, 1, 1, 'moodle/grade:manageoutcomes', 1, 1364029013, 0),
(268, 1, 3, 'moodle/grade:manageletters', 1, 1364029013, 0),
(269, 1, 1, 'moodle/grade:manageletters', 1, 1364029013, 0),
(270, 1, 3, 'moodle/grade:hide', 1, 1364029013, 0),
(271, 1, 1, 'moodle/grade:hide', 1, 1364029013, 0),
(272, 1, 3, 'moodle/grade:lock', 1, 1364029013, 0),
(273, 1, 1, 'moodle/grade:lock', 1, 1364029013, 0),
(274, 1, 3, 'moodle/grade:unlock', 1, 1364029013, 0),
(275, 1, 1, 'moodle/grade:unlock', 1, 1364029013, 0),
(276, 1, 7, 'moodle/my:manageblocks', 1, 1364029013, 0),
(277, 1, 4, 'moodle/notes:view', 1, 1364029013, 0),
(278, 1, 3, 'moodle/notes:view', 1, 1364029013, 0),
(279, 1, 1, 'moodle/notes:view', 1, 1364029013, 0),
(280, 1, 4, 'moodle/notes:manage', 1, 1364029013, 0),
(281, 1, 3, 'moodle/notes:manage', 1, 1364029013, 0),
(282, 1, 1, 'moodle/notes:manage', 1, 1364029013, 0),
(283, 1, 4, 'moodle/tag:manage', 1, 1364029013, 0),
(284, 1, 3, 'moodle/tag:manage', 1, 1364029013, 0),
(285, 1, 1, 'moodle/tag:manage', 1, 1364029013, 0),
(286, 1, 1, 'moodle/tag:create', 1, 1364029013, 0),
(287, 1, 7, 'moodle/tag:create', 1, 1364029013, 0),
(288, 1, 1, 'moodle/tag:edit', 1, 1364029013, 0),
(289, 1, 7, 'moodle/tag:edit', 1, 1364029013, 0),
(290, 1, 4, 'moodle/tag:editblocks', 1, 1364029013, 0),
(291, 1, 3, 'moodle/tag:editblocks', 1, 1364029013, 0),
(292, 1, 1, 'moodle/tag:editblocks', 1, 1364029013, 0),
(293, 1, 6, 'moodle/block:view', 1, 1364029013, 0),
(294, 1, 7, 'moodle/block:view', 1, 1364029013, 0),
(295, 1, 5, 'moodle/block:view', 1, 1364029013, 0),
(296, 1, 4, 'moodle/block:view', 1, 1364029013, 0),
(297, 1, 3, 'moodle/block:view', 1, 1364029013, 0),
(298, 1, 3, 'moodle/block:edit', 1, 1364029013, 0),
(299, 1, 1, 'moodle/block:edit', 1, 1364029013, 0),
(300, 1, 7, 'moodle/portfolio:export', 1, 1364029013, 0),
(301, 1, 5, 'moodle/portfolio:export', 1, 1364029013, 0),
(302, 1, 4, 'moodle/portfolio:export', 1, 1364029013, 0),
(303, 1, 3, 'moodle/portfolio:export', 1, 1364029013, 0),
(304, 1, 8, 'moodle/comment:view', 1, 1364029013, 0),
(305, 1, 6, 'moodle/comment:view', 1, 1364029013, 0),
(306, 1, 7, 'moodle/comment:view', 1, 1364029014, 0),
(307, 1, 5, 'moodle/comment:view', 1, 1364029014, 0),
(308, 1, 4, 'moodle/comment:view', 1, 1364029014, 0),
(309, 1, 3, 'moodle/comment:view', 1, 1364029014, 0),
(310, 1, 1, 'moodle/comment:view', 1, 1364029014, 0),
(311, 1, 7, 'moodle/comment:post', 1, 1364029014, 0),
(312, 1, 5, 'moodle/comment:post', 1, 1364029014, 0),
(313, 1, 4, 'moodle/comment:post', 1, 1364029014, 0),
(314, 1, 3, 'moodle/comment:post', 1, 1364029014, 0),
(315, 1, 1, 'moodle/comment:post', 1, 1364029014, 0),
(316, 1, 3, 'moodle/comment:delete', 1, 1364029014, 0),
(317, 1, 1, 'moodle/comment:delete', 1, 1364029014, 0),
(318, 1, 1, 'moodle/webservice:createtoken', 1, 1364029014, 0),
(319, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1364029014, 0),
(320, 1, 7, 'moodle/rating:view', 1, 1364029014, 0),
(321, 1, 5, 'moodle/rating:view', 1, 1364029014, 0),
(322, 1, 4, 'moodle/rating:view', 1, 1364029014, 0),
(323, 1, 3, 'moodle/rating:view', 1, 1364029014, 0),
(324, 1, 1, 'moodle/rating:view', 1, 1364029014, 0),
(325, 1, 7, 'moodle/rating:viewany', 1, 1364029014, 0),
(326, 1, 5, 'moodle/rating:viewany', 1, 1364029014, 0),
(327, 1, 4, 'moodle/rating:viewany', 1, 1364029014, 0),
(328, 1, 3, 'moodle/rating:viewany', 1, 1364029014, 0),
(329, 1, 1, 'moodle/rating:viewany', 1, 1364029014, 0),
(330, 1, 7, 'moodle/rating:viewall', 1, 1364029014, 0),
(331, 1, 5, 'moodle/rating:viewall', 1, 1364029014, 0),
(332, 1, 4, 'moodle/rating:viewall', 1, 1364029014, 0),
(333, 1, 3, 'moodle/rating:viewall', 1, 1364029014, 0),
(334, 1, 1, 'moodle/rating:viewall', 1, 1364029014, 0),
(335, 1, 7, 'moodle/rating:rate', 1, 1364029014, 0),
(336, 1, 5, 'moodle/rating:rate', 1, 1364029014, 0),
(337, 1, 4, 'moodle/rating:rate', 1, 1364029014, 0),
(338, 1, 3, 'moodle/rating:rate', 1, 1364029014, 0),
(339, 1, 1, 'moodle/rating:rate', 1, 1364029014, 0),
(340, 1, 1, 'moodle/course:publish', 1, 1364029014, 0),
(341, 1, 4, 'moodle/course:markcomplete', 1, 1364029014, 0),
(342, 1, 3, 'moodle/course:markcomplete', 1, 1364029014, 0),
(343, 1, 1, 'moodle/course:markcomplete', 1, 1364029014, 0),
(344, 1, 1, 'moodle/community:add', 1, 1364029014, 0),
(345, 1, 4, 'moodle/community:add', 1, 1364029014, 0),
(346, 1, 3, 'moodle/community:add', 1, 1364029014, 0),
(347, 1, 1, 'moodle/community:download', 1, 1364029014, 0),
(348, 1, 3, 'moodle/community:download', 1, 1364029014, 0),
(349, 1, 6, 'mod/assignment:view', 1, 1364029027, 0),
(350, 1, 5, 'mod/assignment:view', 1, 1364029027, 0),
(351, 1, 4, 'mod/assignment:view', 1, 1364029027, 0),
(352, 1, 3, 'mod/assignment:view', 1, 1364029027, 0),
(353, 1, 1, 'mod/assignment:view', 1, 1364029027, 0),
(354, 1, 5, 'mod/assignment:submit', 1, 1364029027, 0),
(355, 1, 4, 'mod/assignment:grade', 1, 1364029027, 0),
(356, 1, 3, 'mod/assignment:grade', 1, 1364029027, 0),
(357, 1, 1, 'mod/assignment:grade', 1, 1364029027, 0),
(358, 1, 4, 'mod/assignment:exportownsubmission', 1, 1364029027, 0),
(359, 1, 3, 'mod/assignment:exportownsubmission', 1, 1364029027, 0),
(360, 1, 1, 'mod/assignment:exportownsubmission', 1, 1364029027, 0),
(361, 1, 5, 'mod/assignment:exportownsubmission', 1, 1364029027, 0),
(362, 1, 5, 'mod/chat:chat', 1, 1364029029, 0),
(363, 1, 4, 'mod/chat:chat', 1, 1364029029, 0),
(364, 1, 3, 'mod/chat:chat', 1, 1364029029, 0),
(365, 1, 1, 'mod/chat:chat', 1, 1364029029, 0),
(366, 1, 5, 'mod/chat:readlog', 1, 1364029029, 0),
(367, 1, 4, 'mod/chat:readlog', 1, 1364029029, 0),
(368, 1, 3, 'mod/chat:readlog', 1, 1364029029, 0),
(369, 1, 1, 'mod/chat:readlog', 1, 1364029029, 0),
(370, 1, 4, 'mod/chat:deletelog', 1, 1364029029, 0),
(371, 1, 3, 'mod/chat:deletelog', 1, 1364029029, 0),
(372, 1, 1, 'mod/chat:deletelog', 1, 1364029029, 0),
(373, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1364029029, 0),
(374, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1364029029, 0),
(375, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1364029029, 0),
(376, 1, 4, 'mod/chat:exportsession', 1, 1364029029, 0),
(377, 1, 3, 'mod/chat:exportsession', 1, 1364029029, 0),
(378, 1, 1, 'mod/chat:exportsession', 1, 1364029030, 0),
(379, 1, 5, 'mod/choice:choose', 1, 1364029030, 0),
(380, 1, 4, 'mod/choice:choose', 1, 1364029030, 0),
(381, 1, 3, 'mod/choice:choose', 1, 1364029030, 0),
(382, 1, 4, 'mod/choice:readresponses', 1, 1364029030, 0),
(383, 1, 3, 'mod/choice:readresponses', 1, 1364029030, 0),
(384, 1, 1, 'mod/choice:readresponses', 1, 1364029030, 0),
(385, 1, 4, 'mod/choice:deleteresponses', 1, 1364029030, 0),
(386, 1, 3, 'mod/choice:deleteresponses', 1, 1364029030, 0),
(387, 1, 1, 'mod/choice:deleteresponses', 1, 1364029030, 0),
(388, 1, 4, 'mod/choice:downloadresponses', 1, 1364029030, 0),
(389, 1, 3, 'mod/choice:downloadresponses', 1, 1364029030, 0),
(390, 1, 1, 'mod/choice:downloadresponses', 1, 1364029030, 0),
(391, 1, 8, 'mod/data:viewentry', 1, 1364029032, 0),
(392, 1, 6, 'mod/data:viewentry', 1, 1364029032, 0),
(393, 1, 5, 'mod/data:viewentry', 1, 1364029032, 0),
(394, 1, 4, 'mod/data:viewentry', 1, 1364029032, 0),
(395, 1, 3, 'mod/data:viewentry', 1, 1364029032, 0),
(396, 1, 1, 'mod/data:viewentry', 1, 1364029032, 0),
(397, 1, 5, 'mod/data:writeentry', 1, 1364029032, 0),
(398, 1, 4, 'mod/data:writeentry', 1, 1364029032, 0),
(399, 1, 3, 'mod/data:writeentry', 1, 1364029032, 0),
(400, 1, 1, 'mod/data:writeentry', 1, 1364029032, 0),
(401, 1, 5, 'mod/data:comment', 1, 1364029032, 0),
(402, 1, 4, 'mod/data:comment', 1, 1364029032, 0),
(403, 1, 3, 'mod/data:comment', 1, 1364029032, 0),
(404, 1, 1, 'mod/data:comment', 1, 1364029032, 0),
(405, 1, 4, 'mod/data:rate', 1, 1364029032, 0),
(406, 1, 3, 'mod/data:rate', 1, 1364029032, 0),
(407, 1, 1, 'mod/data:rate', 1, 1364029032, 0),
(408, 1, 4, 'mod/data:viewrating', 1, 1364029032, 0),
(409, 1, 3, 'mod/data:viewrating', 1, 1364029032, 0),
(410, 1, 1, 'mod/data:viewrating', 1, 1364029032, 0),
(411, 1, 4, 'mod/data:viewanyrating', 1, 1364029032, 0),
(412, 1, 3, 'mod/data:viewanyrating', 1, 1364029032, 0),
(413, 1, 1, 'mod/data:viewanyrating', 1, 1364029032, 0),
(414, 1, 4, 'mod/data:viewallratings', 1, 1364029032, 0),
(415, 1, 3, 'mod/data:viewallratings', 1, 1364029032, 0),
(416, 1, 1, 'mod/data:viewallratings', 1, 1364029032, 0),
(417, 1, 4, 'mod/data:approve', 1, 1364029032, 0),
(418, 1, 3, 'mod/data:approve', 1, 1364029032, 0),
(419, 1, 1, 'mod/data:approve', 1, 1364029032, 0),
(420, 1, 4, 'mod/data:manageentries', 1, 1364029032, 0),
(421, 1, 3, 'mod/data:manageentries', 1, 1364029032, 0),
(422, 1, 1, 'mod/data:manageentries', 1, 1364029032, 0),
(423, 1, 4, 'mod/data:managecomments', 1, 1364029032, 0),
(424, 1, 3, 'mod/data:managecomments', 1, 1364029032, 0),
(425, 1, 1, 'mod/data:managecomments', 1, 1364029032, 0),
(426, 1, 3, 'mod/data:managetemplates', 1, 1364029032, 0),
(427, 1, 1, 'mod/data:managetemplates', 1, 1364029032, 0),
(428, 1, 4, 'mod/data:viewalluserpresets', 1, 1364029032, 0),
(429, 1, 3, 'mod/data:viewalluserpresets', 1, 1364029032, 0),
(430, 1, 1, 'mod/data:viewalluserpresets', 1, 1364029032, 0),
(431, 1, 1, 'mod/data:manageuserpresets', 1, 1364029032, 0),
(432, 1, 1, 'mod/data:exportentry', 1, 1364029032, 0),
(433, 1, 4, 'mod/data:exportentry', 1, 1364029032, 0),
(434, 1, 3, 'mod/data:exportentry', 1, 1364029032, 0),
(435, 1, 1, 'mod/data:exportownentry', 1, 1364029032, 0),
(436, 1, 4, 'mod/data:exportownentry', 1, 1364029032, 0),
(437, 1, 3, 'mod/data:exportownentry', 1, 1364029032, 0),
(438, 1, 5, 'mod/data:exportownentry', 1, 1364029032, 0),
(439, 1, 1, 'mod/data:exportallentries', 1, 1364029032, 0),
(440, 1, 4, 'mod/data:exportallentries', 1, 1364029032, 0),
(441, 1, 3, 'mod/data:exportallentries', 1, 1364029032, 0),
(442, 1, 6, 'mod/feedback:view', 1, 1364029034, 0),
(443, 1, 5, 'mod/feedback:view', 1, 1364029034, 0),
(444, 1, 4, 'mod/feedback:view', 1, 1364029034, 0),
(445, 1, 3, 'mod/feedback:view', 1, 1364029034, 0),
(446, 1, 1, 'mod/feedback:view', 1, 1364029034, 0),
(447, 1, 5, 'mod/feedback:complete', 1, 1364029034, 0),
(448, 1, 5, 'mod/feedback:viewanalysepage', 1, 1364029034, 0),
(449, 1, 3, 'mod/feedback:viewanalysepage', 1, 1364029034, 0),
(450, 1, 1, 'mod/feedback:viewanalysepage', 1, 1364029034, 0),
(451, 1, 3, 'mod/feedback:deletesubmissions', 1, 1364029034, 0),
(452, 1, 1, 'mod/feedback:deletesubmissions', 1, 1364029034, 0),
(453, 1, 1, 'mod/feedback:mapcourse', 1, 1364029034, 0),
(454, 1, 3, 'mod/feedback:edititems', 1, 1364029034, 0),
(455, 1, 1, 'mod/feedback:edititems', 1, 1364029034, 0),
(456, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1364029034, 0),
(457, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1364029034, 0),
(458, 1, 3, 'mod/feedback:createpublictemplate', 1, 1364029034, 0),
(459, 1, 1, 'mod/feedback:createpublictemplate', 1, 1364029034, 0),
(460, 1, 3, 'mod/feedback:deletetemplate', 1, 1364029034, 0),
(461, 1, 1, 'mod/feedback:deletetemplate', 1, 1364029034, 0),
(462, 1, 4, 'mod/feedback:viewreports', 1, 1364029034, 0),
(463, 1, 3, 'mod/feedback:viewreports', 1, 1364029034, 0),
(464, 1, 1, 'mod/feedback:viewreports', 1, 1364029034, 0),
(465, 1, 4, 'mod/feedback:receivemail', 1, 1364029034, 0),
(466, 1, 3, 'mod/feedback:receivemail', 1, 1364029034, 0),
(467, 1, 6, 'mod/folder:view', 1, 1364029035, 0),
(468, 1, 7, 'mod/folder:view', 1, 1364029035, 0),
(469, 1, 3, 'mod/folder:managefiles', 1, 1364029035, 0),
(470, 1, 8, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(471, 1, 6, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(472, 1, 5, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(473, 1, 4, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(474, 1, 3, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(475, 1, 1, 'mod/forum:viewdiscussion', 1, 1364029036, 0),
(476, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1364029036, 0),
(477, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1364029036, 0),
(478, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1364029036, 0),
(479, 1, 5, 'mod/forum:startdiscussion', 1, 1364029036, 0),
(480, 1, 4, 'mod/forum:startdiscussion', 1, 1364029036, 0),
(481, 1, 3, 'mod/forum:startdiscussion', 1, 1364029036, 0),
(482, 1, 1, 'mod/forum:startdiscussion', 1, 1364029036, 0),
(483, 1, 5, 'mod/forum:replypost', 1, 1364029036, 0),
(484, 1, 4, 'mod/forum:replypost', 1, 1364029036, 0),
(485, 1, 3, 'mod/forum:replypost', 1, 1364029036, 0),
(486, 1, 1, 'mod/forum:replypost', 1, 1364029036, 0),
(487, 1, 4, 'mod/forum:addnews', 1, 1364029036, 0),
(488, 1, 3, 'mod/forum:addnews', 1, 1364029036, 0),
(489, 1, 1, 'mod/forum:addnews', 1, 1364029036, 0),
(490, 1, 4, 'mod/forum:replynews', 1, 1364029036, 0),
(491, 1, 3, 'mod/forum:replynews', 1, 1364029036, 0),
(492, 1, 1, 'mod/forum:replynews', 1, 1364029037, 0),
(493, 1, 5, 'mod/forum:viewrating', 1, 1364029037, 0),
(494, 1, 4, 'mod/forum:viewrating', 1, 1364029037, 0),
(495, 1, 3, 'mod/forum:viewrating', 1, 1364029037, 0),
(496, 1, 1, 'mod/forum:viewrating', 1, 1364029037, 0),
(497, 1, 4, 'mod/forum:viewanyrating', 1, 1364029037, 0),
(498, 1, 3, 'mod/forum:viewanyrating', 1, 1364029037, 0),
(499, 1, 1, 'mod/forum:viewanyrating', 1, 1364029037, 0),
(500, 1, 4, 'mod/forum:viewallratings', 1, 1364029037, 0),
(501, 1, 3, 'mod/forum:viewallratings', 1, 1364029037, 0),
(502, 1, 1, 'mod/forum:viewallratings', 1, 1364029037, 0),
(503, 1, 4, 'mod/forum:rate', 1, 1364029037, 0),
(504, 1, 3, 'mod/forum:rate', 1, 1364029037, 0),
(505, 1, 1, 'mod/forum:rate', 1, 1364029037, 0),
(506, 1, 5, 'mod/forum:createattachment', 1, 1364029037, 0),
(507, 1, 4, 'mod/forum:createattachment', 1, 1364029037, 0),
(508, 1, 3, 'mod/forum:createattachment', 1, 1364029037, 0),
(509, 1, 1, 'mod/forum:createattachment', 1, 1364029037, 0),
(510, 1, 5, 'mod/forum:deleteownpost', 1, 1364029037, 0),
(511, 1, 4, 'mod/forum:deleteownpost', 1, 1364029037, 0),
(512, 1, 3, 'mod/forum:deleteownpost', 1, 1364029037, 0),
(513, 1, 1, 'mod/forum:deleteownpost', 1, 1364029037, 0),
(514, 1, 4, 'mod/forum:deleteanypost', 1, 1364029037, 0),
(515, 1, 3, 'mod/forum:deleteanypost', 1, 1364029037, 0),
(516, 1, 1, 'mod/forum:deleteanypost', 1, 1364029037, 0),
(517, 1, 4, 'mod/forum:splitdiscussions', 1, 1364029037, 0),
(518, 1, 3, 'mod/forum:splitdiscussions', 1, 1364029037, 0),
(519, 1, 1, 'mod/forum:splitdiscussions', 1, 1364029037, 0),
(520, 1, 4, 'mod/forum:movediscussions', 1, 1364029037, 0),
(521, 1, 3, 'mod/forum:movediscussions', 1, 1364029037, 0),
(522, 1, 1, 'mod/forum:movediscussions', 1, 1364029037, 0),
(523, 1, 4, 'mod/forum:editanypost', 1, 1364029037, 0),
(524, 1, 3, 'mod/forum:editanypost', 1, 1364029037, 0),
(525, 1, 1, 'mod/forum:editanypost', 1, 1364029037, 0),
(526, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1364029037, 0),
(527, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1364029037, 0),
(528, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1364029037, 0),
(529, 1, 4, 'mod/forum:viewsubscribers', 1, 1364029037, 0),
(530, 1, 3, 'mod/forum:viewsubscribers', 1, 1364029037, 0),
(531, 1, 1, 'mod/forum:viewsubscribers', 1, 1364029037, 0),
(532, 1, 4, 'mod/forum:managesubscriptions', 1, 1364029037, 0),
(533, 1, 3, 'mod/forum:managesubscriptions', 1, 1364029037, 0),
(534, 1, 1, 'mod/forum:managesubscriptions', 1, 1364029037, 0),
(535, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1364029037, 0),
(536, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1364029037, 0),
(537, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1364029037, 0),
(538, 1, 4, 'mod/forum:exportdiscussion', 1, 1364029037, 0),
(539, 1, 3, 'mod/forum:exportdiscussion', 1, 1364029037, 0),
(540, 1, 1, 'mod/forum:exportdiscussion', 1, 1364029037, 0),
(541, 1, 4, 'mod/forum:exportpost', 1, 1364029037, 0),
(542, 1, 3, 'mod/forum:exportpost', 1, 1364029037, 0),
(543, 1, 1, 'mod/forum:exportpost', 1, 1364029037, 0),
(544, 1, 4, 'mod/forum:exportownpost', 1, 1364029037, 0),
(545, 1, 3, 'mod/forum:exportownpost', 1, 1364029037, 0),
(546, 1, 1, 'mod/forum:exportownpost', 1, 1364029037, 0),
(547, 1, 5, 'mod/forum:exportownpost', 1, 1364029037, 0),
(548, 1, 4, 'mod/forum:addquestion', 1, 1364029037, 0),
(549, 1, 3, 'mod/forum:addquestion', 1, 1364029037, 0),
(550, 1, 1, 'mod/forum:addquestion', 1, 1364029037, 0),
(551, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1364029037, 0),
(552, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1364029037, 0),
(553, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1364029037, 0),
(554, 1, 5, 'mod/glossary:write', 1, 1364029039, 0),
(555, 1, 4, 'mod/glossary:write', 1, 1364029039, 0),
(556, 1, 3, 'mod/glossary:write', 1, 1364029039, 0),
(557, 1, 1, 'mod/glossary:write', 1, 1364029039, 0),
(558, 1, 4, 'mod/glossary:manageentries', 1, 1364029039, 0),
(559, 1, 3, 'mod/glossary:manageentries', 1, 1364029039, 0),
(560, 1, 1, 'mod/glossary:manageentries', 1, 1364029039, 0),
(561, 1, 4, 'mod/glossary:managecategories', 1, 1364029039, 0),
(562, 1, 3, 'mod/glossary:managecategories', 1, 1364029039, 0),
(563, 1, 1, 'mod/glossary:managecategories', 1, 1364029039, 0),
(564, 1, 5, 'mod/glossary:comment', 1, 1364029039, 0),
(565, 1, 4, 'mod/glossary:comment', 1, 1364029039, 0),
(566, 1, 3, 'mod/glossary:comment', 1, 1364029039, 0),
(567, 1, 1, 'mod/glossary:comment', 1, 1364029039, 0),
(568, 1, 4, 'mod/glossary:managecomments', 1, 1364029039, 0),
(569, 1, 3, 'mod/glossary:managecomments', 1, 1364029039, 0),
(570, 1, 1, 'mod/glossary:managecomments', 1, 1364029039, 0),
(571, 1, 4, 'mod/glossary:import', 1, 1364029039, 0),
(572, 1, 3, 'mod/glossary:import', 1, 1364029039, 0),
(573, 1, 1, 'mod/glossary:import', 1, 1364029039, 0),
(574, 1, 4, 'mod/glossary:export', 1, 1364029039, 0),
(575, 1, 3, 'mod/glossary:export', 1, 1364029039, 0),
(576, 1, 1, 'mod/glossary:export', 1, 1364029039, 0),
(577, 1, 4, 'mod/glossary:approve', 1, 1364029039, 0),
(578, 1, 3, 'mod/glossary:approve', 1, 1364029039, 0),
(579, 1, 1, 'mod/glossary:approve', 1, 1364029039, 0),
(580, 1, 4, 'mod/glossary:rate', 1, 1364029039, 0),
(581, 1, 3, 'mod/glossary:rate', 1, 1364029039, 0),
(582, 1, 1, 'mod/glossary:rate', 1, 1364029039, 0),
(583, 1, 4, 'mod/glossary:viewrating', 1, 1364029039, 0),
(584, 1, 3, 'mod/glossary:viewrating', 1, 1364029039, 0),
(585, 1, 1, 'mod/glossary:viewrating', 1, 1364029039, 0),
(586, 1, 4, 'mod/glossary:viewanyrating', 1, 1364029039, 0),
(587, 1, 3, 'mod/glossary:viewanyrating', 1, 1364029039, 0),
(588, 1, 1, 'mod/glossary:viewanyrating', 1, 1364029039, 0),
(589, 1, 4, 'mod/glossary:viewallratings', 1, 1364029039, 0),
(590, 1, 3, 'mod/glossary:viewallratings', 1, 1364029039, 0),
(591, 1, 1, 'mod/glossary:viewallratings', 1, 1364029039, 0),
(592, 1, 4, 'mod/glossary:exportentry', 1, 1364029039, 0),
(593, 1, 3, 'mod/glossary:exportentry', 1, 1364029039, 0),
(594, 1, 1, 'mod/glossary:exportentry', 1, 1364029039, 0),
(595, 1, 4, 'mod/glossary:exportownentry', 1, 1364029039, 0),
(596, 1, 3, 'mod/glossary:exportownentry', 1, 1364029039, 0),
(597, 1, 1, 'mod/glossary:exportownentry', 1, 1364029039, 0),
(598, 1, 5, 'mod/glossary:exportownentry', 1, 1364029039, 0),
(599, 1, 6, 'mod/imscp:view', 1, 1364029040, 0),
(600, 1, 7, 'mod/imscp:view', 1, 1364029040, 0),
(601, 1, 3, 'mod/lesson:edit', 1, 1364029044, 0),
(602, 1, 1, 'mod/lesson:edit', 1, 1364029044, 0),
(603, 1, 4, 'mod/lesson:manage', 1, 1364029044, 0),
(604, 1, 3, 'mod/lesson:manage', 1, 1364029044, 0),
(605, 1, 1, 'mod/lesson:manage', 1, 1364029044, 0),
(606, 1, 6, 'mod/lti:view', 1, 1364029045, 0),
(607, 1, 5, 'mod/lti:view', 1, 1364029045, 0),
(608, 1, 4, 'mod/lti:view', 1, 1364029045, 0),
(609, 1, 3, 'mod/lti:view', 1, 1364029045, 0),
(610, 1, 1, 'mod/lti:view', 1, 1364029045, 0),
(611, 1, 4, 'mod/lti:grade', 1, 1364029045, 0),
(612, 1, 3, 'mod/lti:grade', 1, 1364029045, 0),
(613, 1, 1, 'mod/lti:grade', 1, 1364029045, 0),
(614, 1, 4, 'mod/lti:manage', 1, 1364029045, 0),
(615, 1, 3, 'mod/lti:manage', 1, 1364029045, 0),
(616, 1, 1, 'mod/lti:manage', 1, 1364029045, 0),
(617, 1, 4, 'mod/lti:addcoursetool', 1, 1364029045, 0),
(618, 1, 3, 'mod/lti:addcoursetool', 1, 1364029046, 0),
(619, 1, 1, 'mod/lti:addcoursetool', 1, 1364029046, 0),
(620, 1, 4, 'mod/lti:requesttooladd', 1, 1364029046, 0),
(621, 1, 3, 'mod/lti:requesttooladd', 1, 1364029046, 0),
(622, 1, 1, 'mod/lti:requesttooladd', 1, 1364029046, 0),
(623, 1, 6, 'mod/page:view', 1, 1364029046, 0),
(624, 1, 7, 'mod/page:view', 1, 1364029046, 0),
(625, 1, 6, 'mod/quiz:view', 1, 1364029049, 0),
(626, 1, 5, 'mod/quiz:view', 1, 1364029049, 0),
(627, 1, 4, 'mod/quiz:view', 1, 1364029049, 0),
(628, 1, 3, 'mod/quiz:view', 1, 1364029049, 0),
(629, 1, 1, 'mod/quiz:view', 1, 1364029049, 0),
(630, 1, 5, 'mod/quiz:attempt', 1, 1364029049, 0),
(631, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1364029049, 0),
(632, 1, 3, 'mod/quiz:manage', 1, 1364029049, 0),
(633, 1, 1, 'mod/quiz:manage', 1, 1364029049, 0),
(634, 1, 3, 'mod/quiz:manageoverrides', 1, 1364029049, 0),
(635, 1, 1, 'mod/quiz:manageoverrides', 1, 1364029049, 0),
(636, 1, 4, 'mod/quiz:preview', 1, 1364029049, 0),
(637, 1, 3, 'mod/quiz:preview', 1, 1364029049, 0),
(638, 1, 1, 'mod/quiz:preview', 1, 1364029049, 0),
(639, 1, 4, 'mod/quiz:grade', 1, 1364029049, 0),
(640, 1, 3, 'mod/quiz:grade', 1, 1364029049, 0),
(641, 1, 1, 'mod/quiz:grade', 1, 1364029049, 0),
(642, 1, 4, 'mod/quiz:regrade', 1, 1364029049, 0),
(643, 1, 3, 'mod/quiz:regrade', 1, 1364029049, 0),
(644, 1, 1, 'mod/quiz:regrade', 1, 1364029049, 0),
(645, 1, 4, 'mod/quiz:viewreports', 1, 1364029049, 0),
(646, 1, 3, 'mod/quiz:viewreports', 1, 1364029049, 0),
(647, 1, 1, 'mod/quiz:viewreports', 1, 1364029049, 0),
(648, 1, 3, 'mod/quiz:deleteattempts', 1, 1364029049, 0),
(649, 1, 1, 'mod/quiz:deleteattempts', 1, 1364029049, 0),
(650, 1, 6, 'mod/resource:view', 1, 1364029050, 0),
(651, 1, 7, 'mod/resource:view', 1, 1364029050, 0),
(652, 1, 4, 'mod/scorm:viewreport', 1, 1364029054, 0),
(653, 1, 3, 'mod/scorm:viewreport', 1, 1364029054, 0),
(654, 1, 1, 'mod/scorm:viewreport', 1, 1364029054, 0),
(655, 1, 5, 'mod/scorm:skipview', 1, 1364029054, 0),
(656, 1, 5, 'mod/scorm:savetrack', 1, 1364029054, 0),
(657, 1, 4, 'mod/scorm:savetrack', 1, 1364029054, 0),
(658, 1, 3, 'mod/scorm:savetrack', 1, 1364029054, 0),
(659, 1, 1, 'mod/scorm:savetrack', 1, 1364029054, 0),
(660, 1, 5, 'mod/scorm:viewscores', 1, 1364029054, 0),
(661, 1, 4, 'mod/scorm:viewscores', 1, 1364029054, 0),
(662, 1, 3, 'mod/scorm:viewscores', 1, 1364029054, 0),
(663, 1, 1, 'mod/scorm:viewscores', 1, 1364029054, 0),
(664, 1, 4, 'mod/scorm:deleteresponses', 1, 1364029054, 0),
(665, 1, 3, 'mod/scorm:deleteresponses', 1, 1364029054, 0),
(666, 1, 1, 'mod/scorm:deleteresponses', 1, 1364029054, 0),
(667, 1, 5, 'mod/survey:participate', 1, 1364029055, 0),
(668, 1, 4, 'mod/survey:participate', 1, 1364029055, 0),
(669, 1, 3, 'mod/survey:participate', 1, 1364029055, 0),
(670, 1, 1, 'mod/survey:participate', 1, 1364029055, 0),
(671, 1, 4, 'mod/survey:readresponses', 1, 1364029055, 0),
(672, 1, 3, 'mod/survey:readresponses', 1, 1364029055, 0),
(673, 1, 1, 'mod/survey:readresponses', 1, 1364029055, 0),
(674, 1, 4, 'mod/survey:download', 1, 1364029055, 0),
(675, 1, 3, 'mod/survey:download', 1, 1364029055, 0),
(676, 1, 1, 'mod/survey:download', 1, 1364029055, 0),
(677, 1, 6, 'mod/url:view', 1, 1364029055, 0),
(678, 1, 7, 'mod/url:view', 1, 1364029055, 0),
(679, 1, 6, 'mod/wiki:viewpage', 1, 1364029056, 0),
(680, 1, 5, 'mod/wiki:viewpage', 1, 1364029056, 0),
(681, 1, 4, 'mod/wiki:viewpage', 1, 1364029056, 0),
(682, 1, 3, 'mod/wiki:viewpage', 1, 1364029056, 0),
(683, 1, 1, 'mod/wiki:viewpage', 1, 1364029056, 0),
(684, 1, 5, 'mod/wiki:editpage', 1, 1364029056, 0),
(685, 1, 4, 'mod/wiki:editpage', 1, 1364029056, 0),
(686, 1, 3, 'mod/wiki:editpage', 1, 1364029057, 0),
(687, 1, 1, 'mod/wiki:editpage', 1, 1364029057, 0),
(688, 1, 5, 'mod/wiki:createpage', 1, 1364029057, 0),
(689, 1, 4, 'mod/wiki:createpage', 1, 1364029057, 0),
(690, 1, 3, 'mod/wiki:createpage', 1, 1364029057, 0),
(691, 1, 1, 'mod/wiki:createpage', 1, 1364029057, 0),
(692, 1, 5, 'mod/wiki:viewcomment', 1, 1364029057, 0),
(693, 1, 4, 'mod/wiki:viewcomment', 1, 1364029057, 0),
(694, 1, 3, 'mod/wiki:viewcomment', 1, 1364029057, 0),
(695, 1, 1, 'mod/wiki:viewcomment', 1, 1364029057, 0),
(696, 1, 5, 'mod/wiki:editcomment', 1, 1364029057, 0),
(697, 1, 4, 'mod/wiki:editcomment', 1, 1364029057, 0),
(698, 1, 3, 'mod/wiki:editcomment', 1, 1364029057, 0),
(699, 1, 1, 'mod/wiki:editcomment', 1, 1364029057, 0),
(700, 1, 4, 'mod/wiki:managecomment', 1, 1364029057, 0),
(701, 1, 3, 'mod/wiki:managecomment', 1, 1364029057, 0),
(702, 1, 1, 'mod/wiki:managecomment', 1, 1364029057, 0),
(703, 1, 4, 'mod/wiki:managefiles', 1, 1364029057, 0),
(704, 1, 3, 'mod/wiki:managefiles', 1, 1364029057, 0),
(705, 1, 1, 'mod/wiki:managefiles', 1, 1364029057, 0),
(706, 1, 4, 'mod/wiki:overridelock', 1, 1364029057, 0),
(707, 1, 3, 'mod/wiki:overridelock', 1, 1364029057, 0),
(708, 1, 1, 'mod/wiki:overridelock', 1, 1364029057, 0),
(709, 1, 4, 'mod/wiki:managewiki', 1, 1364029057, 0),
(710, 1, 3, 'mod/wiki:managewiki', 1, 1364029057, 0),
(711, 1, 1, 'mod/wiki:managewiki', 1, 1364029057, 0),
(712, 1, 6, 'mod/workshop:view', 1, 1364029060, 0),
(713, 1, 5, 'mod/workshop:view', 1, 1364029060, 0),
(714, 1, 4, 'mod/workshop:view', 1, 1364029060, 0),
(715, 1, 3, 'mod/workshop:view', 1, 1364029060, 0),
(716, 1, 1, 'mod/workshop:view', 1, 1364029060, 0),
(717, 1, 4, 'mod/workshop:switchphase', 1, 1364029060, 0),
(718, 1, 3, 'mod/workshop:switchphase', 1, 1364029060, 0),
(719, 1, 1, 'mod/workshop:switchphase', 1, 1364029060, 0),
(720, 1, 3, 'mod/workshop:editdimensions', 1, 1364029060, 0),
(721, 1, 1, 'mod/workshop:editdimensions', 1, 1364029060, 0),
(722, 1, 5, 'mod/workshop:submit', 1, 1364029060, 0),
(723, 1, 5, 'mod/workshop:peerassess', 1, 1364029060, 0),
(724, 1, 4, 'mod/workshop:manageexamples', 1, 1364029060, 0),
(725, 1, 3, 'mod/workshop:manageexamples', 1, 1364029060, 0),
(726, 1, 1, 'mod/workshop:manageexamples', 1, 1364029060, 0),
(727, 1, 4, 'mod/workshop:allocate', 1, 1364029060, 0),
(728, 1, 3, 'mod/workshop:allocate', 1, 1364029060, 0),
(729, 1, 1, 'mod/workshop:allocate', 1, 1364029060, 0),
(730, 1, 4, 'mod/workshop:publishsubmissions', 1, 1364029060, 0),
(731, 1, 3, 'mod/workshop:publishsubmissions', 1, 1364029060, 0),
(732, 1, 1, 'mod/workshop:publishsubmissions', 1, 1364029060, 0),
(733, 1, 5, 'mod/workshop:viewauthornames', 1, 1364029060, 0),
(734, 1, 4, 'mod/workshop:viewauthornames', 1, 1364029060, 0),
(735, 1, 3, 'mod/workshop:viewauthornames', 1, 1364029060, 0),
(736, 1, 1, 'mod/workshop:viewauthornames', 1, 1364029060, 0),
(737, 1, 4, 'mod/workshop:viewreviewernames', 1, 1364029060, 0),
(738, 1, 3, 'mod/workshop:viewreviewernames', 1, 1364029060, 0),
(739, 1, 1, 'mod/workshop:viewreviewernames', 1, 1364029060, 0),
(740, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1364029060, 0),
(741, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1364029060, 0),
(742, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1364029060, 0),
(743, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1364029060, 0),
(744, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1364029060, 0),
(745, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1364029060, 0),
(746, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1364029060, 0),
(747, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1364029060, 0),
(748, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1364029060, 0),
(749, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1364029060, 0),
(750, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1364029060, 0),
(751, 1, 4, 'mod/workshop:viewallassessments', 1, 1364029060, 0),
(752, 1, 3, 'mod/workshop:viewallassessments', 1, 1364029060, 0),
(753, 1, 1, 'mod/workshop:viewallassessments', 1, 1364029060, 0),
(754, 1, 4, 'mod/workshop:overridegrades', 1, 1364029060, 0),
(755, 1, 3, 'mod/workshop:overridegrades', 1, 1364029060, 0),
(756, 1, 1, 'mod/workshop:overridegrades', 1, 1364029060, 0),
(757, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1364029060, 0),
(758, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1364029060, 0),
(759, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1364029060, 0),
(760, 1, 1, 'enrol/authorize:config', 1, 1364029065, 0),
(761, 1, 1, 'enrol/authorize:manage', 1, 1364029065, 0),
(762, 1, 3, 'enrol/authorize:manage', 1, 1364029065, 0),
(763, 1, 1, 'enrol/authorize:unenrol', 1, 1364029065, 0),
(764, 1, 1, 'enrol/authorize:managepayments', 1, 1364029065, 0),
(765, 1, 1, 'enrol/authorize:uploadcsv', 1, 1364029065, 0),
(766, 1, 3, 'enrol/cohort:config', 1, 1364029065, 0),
(767, 1, 1, 'enrol/cohort:config', 1, 1364029065, 0),
(768, 1, 1, 'enrol/guest:config', 1, 1364029066, 0),
(769, 1, 3, 'enrol/guest:config', 1, 1364029066, 0),
(770, 1, 1, 'enrol/ldap:manage', 1, 1364029066, 0),
(771, 1, 1, 'enrol/manual:config', 1, 1364029066, 0),
(772, 1, 1, 'enrol/manual:enrol', 1, 1364029067, 0),
(773, 1, 3, 'enrol/manual:enrol', 1, 1364029067, 0),
(774, 1, 1, 'enrol/manual:manage', 1, 1364029067, 0),
(775, 1, 3, 'enrol/manual:manage', 1, 1364029067, 0),
(776, 1, 1, 'enrol/manual:unenrol', 1, 1364029067, 0),
(777, 1, 3, 'enrol/manual:unenrol', 1, 1364029067, 0),
(778, 1, 1, 'enrol/meta:config', 1, 1364029067, 0),
(779, 1, 3, 'enrol/meta:config', 1, 1364029067, 0),
(780, 1, 1, 'enrol/meta:selectaslinked', 1, 1364029067, 0),
(781, 1, 1, 'enrol/meta:unenrol', 1, 1364029067, 0),
(782, 1, 1, 'enrol/paypal:config', 1, 1364029067, 0),
(783, 1, 1, 'enrol/paypal:manage', 1, 1364029067, 0),
(784, 1, 3, 'enrol/paypal:manage', 1, 1364029067, 0),
(785, 1, 1, 'enrol/paypal:unenrol', 1, 1364029067, 0),
(786, 1, 3, 'enrol/self:config', 1, 1364029067, 0),
(787, 1, 1, 'enrol/self:config', 1, 1364029067, 0),
(788, 1, 3, 'enrol/self:manage', 1, 1364029067, 0),
(789, 1, 1, 'enrol/self:manage', 1, 1364029067, 0),
(790, 1, 5, 'enrol/self:unenrolself', 1, 1364029067, 0),
(791, 1, 3, 'enrol/self:unenrol', 1, 1364029067, 0),
(792, 1, 1, 'enrol/self:unenrol', 1, 1364029067, 0),
(793, 1, 7, 'block/online_users:viewlist', 1, 1364029072, 0),
(794, 1, 6, 'block/online_users:viewlist', 1, 1364029072, 0),
(795, 1, 5, 'block/online_users:viewlist', 1, 1364029072, 0),
(796, 1, 4, 'block/online_users:viewlist', 1, 1364029072, 0),
(797, 1, 3, 'block/online_users:viewlist', 1, 1364029072, 0),
(798, 1, 1, 'block/online_users:viewlist', 1, 1364029072, 0),
(799, 1, 4, 'block/rss_client:manageownfeeds', 1, 1364029072, 0),
(800, 1, 3, 'block/rss_client:manageownfeeds', 1, 1364029072, 0),
(801, 1, 1, 'block/rss_client:manageownfeeds', 1, 1364029072, 0),
(802, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1364029072, 0),
(803, 1, 4, 'report/completion:view', 1, 1364029077, 0),
(804, 1, 3, 'report/completion:view', 1, 1364029077, 0),
(805, 1, 1, 'report/completion:view', 1, 1364029077, 0),
(806, 1, 4, 'report/courseoverview:view', 1, 1364029077, 0),
(807, 1, 3, 'report/courseoverview:view', 1, 1364029077, 0),
(808, 1, 1, 'report/courseoverview:view', 1, 1364029077, 0),
(809, 1, 4, 'report/log:view', 1, 1364029078, 0),
(810, 1, 3, 'report/log:view', 1, 1364029078, 0),
(811, 1, 1, 'report/log:view', 1, 1364029078, 0),
(812, 1, 4, 'report/log:viewtoday', 1, 1364029078, 0),
(813, 1, 3, 'report/log:viewtoday', 1, 1364029078, 0),
(814, 1, 1, 'report/log:viewtoday', 1, 1364029078, 0),
(815, 1, 4, 'report/loglive:view', 1, 1364029078, 0),
(816, 1, 3, 'report/loglive:view', 1, 1364029078, 0),
(817, 1, 1, 'report/loglive:view', 1, 1364029078, 0),
(818, 1, 4, 'report/outline:view', 1, 1364029078, 0),
(819, 1, 3, 'report/outline:view', 1, 1364029078, 0),
(820, 1, 1, 'report/outline:view', 1, 1364029078, 0),
(821, 1, 4, 'report/participation:view', 1, 1364029078, 0),
(822, 1, 3, 'report/participation:view', 1, 1364029078, 0),
(823, 1, 1, 'report/participation:view', 1, 1364029078, 0),
(824, 1, 4, 'report/progress:view', 1, 1364029078, 0),
(825, 1, 3, 'report/progress:view', 1, 1364029078, 0),
(826, 1, 1, 'report/progress:view', 1, 1364029078, 0),
(827, 1, 1, 'report/security:view', 1, 1364029078, 0),
(828, 1, 4, 'report/stats:view', 1, 1364029079, 0),
(829, 1, 3, 'report/stats:view', 1, 1364029079, 0),
(830, 1, 1, 'report/stats:view', 1, 1364029079, 0),
(831, 1, 4, 'gradeexport/ods:view', 1, 1364029079, 0),
(832, 1, 3, 'gradeexport/ods:view', 1, 1364029079, 0),
(833, 1, 1, 'gradeexport/ods:view', 1, 1364029079, 0),
(834, 1, 1, 'gradeexport/ods:publish', 1, 1364029079, 0),
(835, 1, 4, 'gradeexport/txt:view', 1, 1364029079, 0),
(836, 1, 3, 'gradeexport/txt:view', 1, 1364029079, 0),
(837, 1, 1, 'gradeexport/txt:view', 1, 1364029079, 0),
(838, 1, 1, 'gradeexport/txt:publish', 1, 1364029079, 0),
(839, 1, 4, 'gradeexport/xls:view', 1, 1364029079, 0),
(840, 1, 3, 'gradeexport/xls:view', 1, 1364029079, 0),
(841, 1, 1, 'gradeexport/xls:view', 1, 1364029079, 0),
(842, 1, 1, 'gradeexport/xls:publish', 1, 1364029079, 0),
(843, 1, 4, 'gradeexport/xml:view', 1, 1364029079, 0),
(844, 1, 3, 'gradeexport/xml:view', 1, 1364029079, 0),
(845, 1, 1, 'gradeexport/xml:view', 1, 1364029079, 0),
(846, 1, 1, 'gradeexport/xml:publish', 1, 1364029079, 0),
(847, 1, 3, 'gradeimport/csv:view', 1, 1364029079, 0),
(848, 1, 1, 'gradeimport/csv:view', 1, 1364029079, 0),
(849, 1, 3, 'gradeimport/xml:view', 1, 1364029079, 0),
(850, 1, 1, 'gradeimport/xml:view', 1, 1364029079, 0),
(851, 1, 1, 'gradeimport/xml:publish', 1, 1364029079, 0),
(852, 1, 4, 'gradereport/grader:view', 1, 1364029080, 0),
(853, 1, 3, 'gradereport/grader:view', 1, 1364029080, 0),
(854, 1, 1, 'gradereport/grader:view', 1, 1364029080, 0),
(855, 1, 4, 'gradereport/outcomes:view', 1, 1364029080, 0),
(856, 1, 3, 'gradereport/outcomes:view', 1, 1364029080, 0),
(857, 1, 1, 'gradereport/outcomes:view', 1, 1364029080, 0),
(858, 1, 5, 'gradereport/overview:view', 1, 1364029080, 0),
(859, 1, 1, 'gradereport/overview:view', 1, 1364029080, 0),
(860, 1, 5, 'gradereport/user:view', 1, 1364029080, 0),
(861, 1, 4, 'gradereport/user:view', 1, 1364029080, 0),
(862, 1, 3, 'gradereport/user:view', 1, 1364029080, 0),
(863, 1, 1, 'gradereport/user:view', 1, 1364029080, 0),
(864, 1, 7, 'repository/alfresco:view', 1, 1364029083, 0),
(865, 1, 7, 'repository/boxnet:view', 1, 1364029083, 0),
(866, 1, 2, 'repository/coursefiles:view', 1, 1364029083, 0),
(867, 1, 4, 'repository/coursefiles:view', 1, 1364029083, 0),
(868, 1, 3, 'repository/coursefiles:view', 1, 1364029083, 0),
(869, 1, 1, 'repository/coursefiles:view', 1, 1364029083, 0),
(870, 1, 7, 'repository/dropbox:view', 1, 1364029083, 0),
(871, 1, 2, 'repository/filesystem:view', 1, 1364029083, 0),
(872, 1, 4, 'repository/filesystem:view', 1, 1364029083, 0),
(873, 1, 3, 'repository/filesystem:view', 1, 1364029083, 0),
(874, 1, 1, 'repository/filesystem:view', 1, 1364029083, 0),
(875, 1, 7, 'repository/flickr:view', 1, 1364029083, 0),
(876, 1, 7, 'repository/flickr_public:view', 1, 1364029084, 0),
(877, 1, 7, 'repository/googledocs:view', 1, 1364029084, 0),
(878, 1, 2, 'repository/local:view', 1, 1364029084, 0),
(879, 1, 4, 'repository/local:view', 1, 1364029084, 0),
(880, 1, 3, 'repository/local:view', 1, 1364029084, 0),
(881, 1, 1, 'repository/local:view', 1, 1364029084, 0),
(882, 1, 7, 'repository/merlot:view', 1, 1364029084, 0),
(883, 1, 7, 'repository/picasa:view', 1, 1364029084, 0),
(884, 1, 7, 'repository/recent:view', 1, 1364029084, 0),
(885, 1, 7, 'repository/s3:view', 1, 1364029085, 0),
(886, 1, 7, 'repository/upload:view', 1, 1364029085, 0),
(887, 1, 7, 'repository/url:view', 1, 1364029085, 0),
(888, 1, 7, 'repository/user:view', 1, 1364029085, 0),
(889, 1, 2, 'repository/webdav:view', 1, 1364029085, 0),
(890, 1, 4, 'repository/webdav:view', 1, 1364029085, 0),
(891, 1, 3, 'repository/webdav:view', 1, 1364029085, 0),
(892, 1, 1, 'repository/webdav:view', 1, 1364029085, 0),
(893, 1, 7, 'repository/wikimedia:view', 1, 1364029085, 0),
(894, 1, 7, 'repository/youtube:view', 1, 1364029086, 0),
(895, 1, 1, 'tool/customlang:view', 1, 1364029093, 0),
(896, 1, 1, 'tool/customlang:edit', 1, 1364029093, 0),
(897, 1, 4, 'quiz/grading:viewstudentnames', 1, 1364029101, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'quiz/grading:viewstudentnames', 1, 1364029101, 0),
(899, 1, 1, 'quiz/grading:viewstudentnames', 1, 1364029101, 0),
(900, 1, 4, 'quiz/grading:viewidnumber', 1, 1364029101, 0),
(901, 1, 3, 'quiz/grading:viewidnumber', 1, 1364029101, 0),
(902, 1, 1, 'quiz/grading:viewidnumber', 1, 1364029101, 0),
(903, 1, 4, 'quiz/statistics:view', 1, 1364029102, 0),
(904, 1, 3, 'quiz/statistics:view', 1, 1364029102, 0),
(905, 1, 1, 'quiz/statistics:view', 1, 1364029102, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextlevel` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1364194432);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `launch` bigint(10) unsigned NOT NULL DEFAULT '0',
  `skipview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `popup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) unsigned NOT NULL DEFAULT '100',
  `height` bigint(10) unsigned NOT NULL DEFAULT '600',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) unsigned DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) unsigned DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) unsigned NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` text NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(5, 0, 'jqrq6idd9mn376mpnmpd4mc3d7', 3, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo1OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6ODoibmF2Y2FjaGUiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6Im5hdmlnYXRpb24iO2E6Mjp7czoxNjoidXNlcmJsb2dvcHRpb25zMyI7YTozOntpOjA7aToxMzY0MjAxOTE4O2k6MTtzOjE6IjMiO2k6MjtzOjY5NzoiYToyOntzOjQ6InZpZXciO2E6Mjp7czo2OiJzdHJpbmciO3M6MjI6IlZpZXcgYWxsIG9mIG15IGVudHJpZXMiO3M6NDoibGluayI7TzoxMDoibW9vZGxlX3VybCI6OTp7czo5OiIAKgBzY2hlbWUiO3M6NDoiaHR0cCI7czo3OiIAKgBob3N0IjtzOjk6ImxvY2FsaG9zdCI7czo3OiIAKgBwb3J0IjtzOjA6IiI7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIyOiIvbW9vZGxlL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MToiMyI7fX19czozOiJhZGQiO2E6Mjp7czo2OiJzdHJpbmciO3M6MTU6IkFkZCBhIG5ldyBlbnRyeSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjE6Ii9tb29kbGUvYmxvZy9lZGl0LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoiYWN0aW9uIjtzOjM6ImFkZCI7fX19fSI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczQ3IjthOjM6e2k6MDtpOjEzNjQyMDE5MTg7aToxO3M6MToiMyI7aToyO3M6NDoiYjowOyI7fX19czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjA7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3QvbW9vZGxlL2NvdXJzZS92aWV3LnBocD9pZD0yIjt9VVNFUnxPOjg6InN0ZENsYXNzIjo2Mjp7czoyOiJpZCI7czoxOiIzIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo4OiJwcmlzdGluZSI7czo4OiJwYXNzd29yZCI7czozMjoiMzRmM2Y5YzQ4M2YzNmU5Y2ExY2U1NTRkMjcwYmUzNDgiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo4OiJwcmlzdGluZSI7czo4OiJsYXN0bmFtZSI7czo5OiJlZHVjYXRpb24iO3M6NToiZW1haWwiO3M6MTQ6ImFtaXRAZW5lZXYuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6MzoibXVtIjtzOjc6ImNvdW50cnkiO3M6MjoiSU4iO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtpOjEzNjQyMDE5MTc7czoxMDoibGFzdGFjY2VzcyI7aToxMzY0MjAzMjE5O3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzY0MjAxOTE3O3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIxIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMiI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMCI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxMDoiMTM2NDE5NzYzMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzY0MTk3NjMwIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7czowOiIiO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjI6e2k6MztpOjEzNjQyMDIzMDE7aToyO2k6MTM2NDIwMzIxOTt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTowOnt9czo3OiJzZXNza2V5IjtzOjEwOiJqMzRoNm1DRHZWIjtzOjEwOiJwcmVmZXJlbmNlIjthOjQ6e3M6MjQ6ImF1dGhfZm9yY2VwYXNzd29yZGNoYW5nZSI7czoxOiIwIjtzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzY0MjAzMjQ0O31zOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjQ6e3M6MjoiLzEiO2E6MTp7aTo3O2k6Nzt9czo0OiIvMS8yIjthOjE6e2k6ODtpOjg7fXM6NzoiLzEvMy8xNSI7YToxOntpOjU7aTo1O31zOjc6Ii8xLzMvMjAiO2E6MTp7aTo1O2k6NTt9fXM6NDoicmRlZiI7YTozOntzOjQ6Ii8xOjciO2E6NDc6e3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtpOjE7czoxMjoibW9kL3VybDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtpOjE7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO2k6MTtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZWRpdCI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOjE7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO2k6MTtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7aToxO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtpOjE7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7aToxO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtpOjE7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO2k6MTtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtpOjE7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7aToxO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtpOjE7czoyNToicmVwb3NpdG9yeS93aWtpbWVkaWE6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtpOjE7fXM6NDoiLzE6NSI7YTo2Nzp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czoyMjoiZW5yb2wvc2VsZjp1bmVucm9sc2VsZiI7aToxO3M6MjU6ImdyYWRlcmVwb3J0L292ZXJ2aWV3OnZpZXciO2k6MTtzOjIxOiJncmFkZXJlcG9ydC91c2VyOnZpZXciO2k6MTtzOjM0OiJtb2QvYXNzaWdubWVudDpleHBvcnRvd25zdWJtaXNzaW9uIjtpOjE7czoyMToibW9kL2Fzc2lnbm1lbnQ6c3VibWl0IjtpOjE7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7aToxO3M6MTM6Im1vZC9jaGF0OmNoYXQiO2k6MTtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtpOjE7czoxNzoibW9kL2Nob2ljZTpjaG9vc2UiO2k6MTtzOjE2OiJtb2QvZGF0YTpjb21tZW50IjtpOjE7czoyMzoibW9kL2RhdGE6ZXhwb3J0b3duZW50cnkiO2k6MTtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjE5OiJtb2QvZGF0YTp3cml0ZWVudHJ5IjtpOjE7czoyMToibW9kL2ZlZWRiYWNrOmNvbXBsZXRlIjtpOjE7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO2k6MTtzOjI4OiJtb2QvZmVlZGJhY2s6dmlld2FuYWx5c2VwYWdlIjtpOjE7czoyOToibW9kL2ZvcnVtOmFsbG93Zm9yY2VzdWJzY3JpYmUiO2k6MTtzOjI2OiJtb2QvZm9ydW06Y3JlYXRlYXR0YWNobWVudCI7aToxO3M6MjM6Im1vZC9mb3J1bTpkZWxldGVvd25wb3N0IjtpOjE7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO2k6MTtzOjE5OiJtb2QvZm9ydW06cmVwbHlwb3N0IjtpOjE7czoyNToibW9kL2ZvcnVtOnN0YXJ0ZGlzY3Vzc2lvbiI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MjA6Im1vZC9mb3J1bTp2aWV3cmF0aW5nIjtpOjE7czoyMDoibW9kL2dsb3NzYXJ5OmNvbW1lbnQiO2k6MTtzOjI3OiJtb2QvZ2xvc3Nhcnk6ZXhwb3J0b3duZW50cnkiO2k6MTtzOjE4OiJtb2QvZ2xvc3Nhcnk6d3JpdGUiO2k6MTtzOjEyOiJtb2QvbHRpOnZpZXciO2k6MTtzOjE2OiJtb2QvcXVpejphdHRlbXB0IjtpOjE7czoyNToibW9kL3F1aXo6cmV2aWV3bXlhdHRlbXB0cyI7aToxO3M6MTM6Im1vZC9xdWl6OnZpZXciO2k6MTtzOjE5OiJtb2Qvc2Nvcm06c2F2ZXRyYWNrIjtpOjE7czoxODoibW9kL3Njb3JtOnNraXB2aWV3IjtpOjE7czoyMDoibW9kL3Njb3JtOnZpZXdzY29yZXMiO2k6MTtzOjIyOiJtb2Qvc3VydmV5OnBhcnRpY2lwYXRlIjtpOjE7czoxOToibW9kL3dpa2k6Y3JlYXRlcGFnZSI7aToxO3M6MjA6Im1vZC93aWtpOmVkaXRjb21tZW50IjtpOjE7czoxNzoibW9kL3dpa2k6ZWRpdHBhZ2UiO2k6MTtzOjIwOiJtb2Qvd2lraTp2aWV3Y29tbWVudCI7aToxO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtpOjE7czoyMzoibW9kL3dvcmtzaG9wOnBlZXJhc3Nlc3MiO2k6MTtzOjE5OiJtb2Qvd29ya3Nob3A6c3VibWl0IjtpOjE7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO2k6MTtzOjI4OiJtb2Qvd29ya3Nob3A6dmlld2F1dGhvcm5hbWVzIjtpOjE7czozMjoibW9kL3dvcmtzaG9wOnZpZXdhdXRob3JwdWJsaXNoZWQiO2k6MTtzOjM3OiJtb2Qvd29ya3Nob3A6dmlld3B1Ymxpc2hlZHN1Ym1pc3Npb25zIjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6MzA6Im1vb2RsZS9jb3Vyc2U6dmlld3BhcnRpY2lwYW50cyI7aToxO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlld3NjYWxlcyI7aToxO3M6MTc6Im1vb2RsZS9ncmFkZTp2aWV3IjtpOjE7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO2k6MTtzOjIwOiJtb29kbGUvcXVlc3Rpb246ZmxhZyI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FueSI7aToxO3M6MjU6Im1vb2RsZS91c2VyOnJlYWR1c2VyYmxvZ3MiO2k6MTtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcnBvc3RzIjtpOjE7czoyMzoibW9vZGxlL3VzZXI6dmlld2RldGFpbHMiO2k6MTt9czo0OiIvMTo4IjthOjM6e3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTt9fXM6MTA6InJkZWZfY291bnQiO2k6MztzOjg6InJkZWZfbGNjIjtpOjM7czo2OiJsb2FkZWQiO2E6Mzp7aToxO2k6MTtpOjM7aToxO2k6MjtpOjE7fXM6NDoidGltZSI7aToxMzY0MjAxOTE4O3M6MzoicnN3IjthOjA6e319czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjI6e2k6MztpOjIxNDc0ODM2NDc7aToyO2k6MjE0NzQ4MzY0Nzt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjI7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjU6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9czo3OiJlZGl0aW5nIjtpOjA7fQ==', 1364201917, 1364203244, '127.0.0.1', '127.0.0.1'),
(7, 0, 'qgolgk2p6jp5sd7agupi33fia7', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo1OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2k6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjI6e3M6MTY6InVzZXJibG9nb3B0aW9uczIiO2E6Mzp7aTowO2k6MTM2NDIwMjYxNDtpOjE7czoxOiIyIjtpOjI7czo2OTc6ImE6Mjp7czo0OiJ2aWV3IjthOjI6e3M6Njoic3RyaW5nIjtzOjIyOiJWaWV3IGFsbCBvZiBteSBlbnRyaWVzIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyMjoiL21vb2RsZS9ibG9nL2luZGV4LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoidXNlcmlkIjtzOjE6IjIiO319fXM6MzoiYWRkIjthOjI6e3M6Njoic3RyaW5nIjtzOjE1OiJBZGQgYSBuZXcgZW50cnkiO3M6NDoibGluayI7TzoxMDoibW9vZGxlX3VybCI6OTp7czo5OiIAKgBzY2hlbWUiO3M6NDoiaHR0cCI7czo3OiIAKgBob3N0IjtzOjk6ImxvY2FsaG9zdCI7czo3OiIAKgBwb3J0IjtzOjA6IiI7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjIxOiIvbW9vZGxlL2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE2OiJjb250ZXh0aGFzcmVwb3M1IjthOjM6e2k6MDtpOjEzNjQyMDI2MTQ7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fX19fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MToiMiI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6ODoicGFzc3dvcmQiO3M6MzI6IjM0ZjNmOWM0ODNmMzZlOWNhMWNlNTU0ZDI3MGJlMzQ4IjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6NToiQWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NDoiVXNlciI7czo1OiJlbWFpbCI7czoxNToiYW5raXRAZW5lZXYuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6NjoiYm9tYmF5IjtzOjc6ImNvdW50cnkiO3M6MjoiSU4iO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzY0MDI5MTc3IjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzNjQyMDI1Nzc7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzNjQxOTE5NDQiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzY0MjAyNTc3O3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMSI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjQ6ImFqYXgiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxOiIwIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzNjQwMjkyMzMiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTI6InNjcmVlbnJlYWRlciI7czoxOiIwIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjI6e2k6MjtzOjEwOiIxMzY0MjAxNjQzIjtpOjM7czoxMDoiMTM2NDIwMTY0MSI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6MDp7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiczFNcm5id1RkSyI7czoxMDoicHJlZmVyZW5jZSI7YTozOntzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzY0MjAyNjEyO31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6NzoiZGlzcGxheSI7YToxOntpOjE7aTowO31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjY6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazZoaWRkZW4iO3M6NDoiYm9vbCI7fX0=', 1364202577, 1364202615, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer1` text NOT NULL,
  `answer2` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `correlatedtags` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `tiuserid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ordering` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) unsigned NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) unsigned NOT NULL,
  `timecustomized` bigint(10) unsigned DEFAULT NULL,
  `outdated` smallint(3) unsigned DEFAULT '0',
  `modified` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` text,
  `backtrace` text,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=788 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2011120509', '2011120509', 'Upgrade savepoint reached', NULL, '', 0, 1364029014),
(2, 0, 'core', '2011120509', '2011120509', 'Core installed', NULL, '', 0, 1364029021),
(3, 0, 'qtype_calculated', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029021),
(4, 0, 'qtype_calculated', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029022),
(5, 0, 'qtype_calculated', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029022),
(6, 0, 'qtype_calculatedmulti', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029022),
(7, 0, 'qtype_calculatedmulti', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029022),
(8, 0, 'qtype_calculatedmulti', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029023),
(9, 0, 'qtype_calculatedsimple', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029023),
(10, 0, 'qtype_calculatedsimple', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029023),
(11, 0, 'qtype_calculatedsimple', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029023),
(12, 0, 'qtype_description', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029023),
(13, 0, 'qtype_description', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029023),
(14, 0, 'qtype_description', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029023),
(15, 0, 'qtype_essay', NULL, '2011102702', 'Starting plugin installation', NULL, '', 0, 1364029024),
(16, 0, 'qtype_essay', '2011102702', '2011102702', 'Upgrade savepoint reached', NULL, '', 0, 1364029025),
(17, 0, 'qtype_essay', '2011102702', '2011102702', 'Plugin installed', NULL, '', 0, 1364029025),
(18, 0, 'qtype_match', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029025),
(19, 0, 'qtype_match', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029025),
(20, 0, 'qtype_match', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029025),
(21, 0, 'qtype_missingtype', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029025),
(22, 0, 'qtype_missingtype', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029025),
(23, 0, 'qtype_missingtype', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029025),
(24, 0, 'qtype_multianswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029025),
(25, 0, 'qtype_multianswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029026),
(26, 0, 'qtype_multianswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029026),
(27, 0, 'qtype_multichoice', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029026),
(28, 0, 'qtype_multichoice', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029026),
(29, 0, 'qtype_multichoice', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029026),
(30, 0, 'qtype_numerical', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029026),
(31, 0, 'qtype_numerical', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029026),
(32, 0, 'qtype_numerical', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029026),
(33, 0, 'qtype_random', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029026),
(34, 0, 'qtype_random', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029026),
(35, 0, 'qtype_random', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029026),
(36, 0, 'qtype_randomsamatch', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1364029026),
(37, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1364029026),
(38, 0, 'qtype_randomsamatch', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1364029027),
(39, 0, 'qtype_shortanswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029027),
(40, 0, 'qtype_shortanswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029027),
(41, 0, 'qtype_shortanswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029027),
(42, 0, 'qtype_truefalse', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029027),
(43, 0, 'qtype_truefalse', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029027),
(44, 0, 'qtype_truefalse', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029027),
(45, 0, 'mod_assignment', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029027),
(46, 0, 'mod_assignment', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029028),
(47, 0, 'mod_chat', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029028),
(48, 0, 'mod_chat', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029030),
(49, 0, 'mod_choice', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029030),
(50, 0, 'mod_choice', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029031),
(51, 0, 'mod_data', NULL, '2011112902', 'Starting plugin installation', NULL, '', 0, 1364029031),
(52, 0, 'mod_data', '2011112902', '2011112902', 'Plugin installed', NULL, '', 0, 1364029032),
(53, 0, 'mod_feedback', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029032),
(54, 0, 'mod_feedback', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029035),
(55, 0, 'mod_folder', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029035),
(56, 0, 'mod_folder', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029035),
(57, 0, 'mod_forum', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029035),
(58, 0, 'mod_forum', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029038),
(59, 0, 'mod_glossary', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029038),
(60, 0, 'mod_glossary', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029040),
(61, 0, 'mod_imscp', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029040),
(62, 0, 'mod_imscp', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029040),
(63, 0, 'mod_label', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029040),
(64, 0, 'mod_label', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029040),
(65, 0, 'mod_lesson', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029040),
(66, 0, 'mod_lesson', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029045),
(67, 0, 'mod_lti', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029045),
(68, 0, 'mod_lti', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029046),
(69, 0, 'mod_page', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029046),
(70, 0, 'mod_page', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029046),
(71, 0, 'mod_quiz', NULL, '2011112904', 'Starting plugin installation', NULL, '', 0, 1364029046),
(72, 0, 'mod_quiz', '2011112904', '2011112904', 'Plugin installed', NULL, '', 0, 1364029049),
(73, 0, 'mod_resource', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029049),
(74, 0, 'mod_resource', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029050),
(75, 0, 'mod_scorm', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029050),
(76, 0, 'mod_scorm', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029054),
(77, 0, 'mod_survey', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029054),
(78, 0, 'mod_survey', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029055),
(79, 0, 'mod_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029055),
(80, 0, 'mod_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029056),
(81, 0, 'mod_wiki', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029056),
(82, 0, 'mod_wiki', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029057),
(83, 0, 'mod_workshop', NULL, '2011112902', 'Starting plugin installation', NULL, '', 0, 1364029057),
(84, 0, 'mod_workshop', '2011112902', '2011112902', 'Plugin installed', NULL, '', 0, 1364029060),
(85, 0, 'auth_cas', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029060),
(86, 0, 'auth_cas', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029060),
(87, 0, 'auth_cas', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029061),
(88, 0, 'auth_db', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029061),
(89, 0, 'auth_db', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029061),
(90, 0, 'auth_db', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029061),
(91, 0, 'auth_email', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029061),
(92, 0, 'auth_email', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029061),
(93, 0, 'auth_email', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029061),
(94, 0, 'auth_fc', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029061),
(95, 0, 'auth_fc', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029061),
(96, 0, 'auth_fc', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029062),
(97, 0, 'auth_imap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029062),
(98, 0, 'auth_imap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029062),
(99, 0, 'auth_imap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029062),
(100, 0, 'auth_ldap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029062),
(101, 0, 'auth_ldap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029062),
(102, 0, 'auth_ldap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029062),
(103, 0, 'auth_manual', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029062),
(104, 0, 'auth_manual', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029062),
(105, 0, 'auth_manual', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029062),
(106, 0, 'auth_mnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029062),
(107, 0, 'auth_mnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029062),
(108, 0, 'auth_mnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029062),
(109, 0, 'auth_nntp', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029062),
(110, 0, 'auth_nntp', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(111, 0, 'auth_nntp', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(112, 0, 'auth_nologin', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(113, 0, 'auth_nologin', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(114, 0, 'auth_nologin', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(115, 0, 'auth_none', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(116, 0, 'auth_none', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(117, 0, 'auth_none', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(118, 0, 'auth_pam', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(119, 0, 'auth_pam', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(120, 0, 'auth_pam', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(121, 0, 'auth_pop3', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(122, 0, 'auth_pop3', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(123, 0, 'auth_pop3', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(124, 0, 'auth_radius', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(125, 0, 'auth_radius', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(126, 0, 'auth_radius', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(127, 0, 'auth_shibboleth', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(128, 0, 'auth_shibboleth', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(129, 0, 'auth_shibboleth', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029063),
(130, 0, 'auth_webservice', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029063),
(131, 0, 'auth_webservice', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029063),
(132, 0, 'auth_webservice', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029064),
(133, 0, 'enrol_authorize', NULL, '2011112902', 'Starting plugin installation', NULL, '', 0, 1364029064),
(134, 0, 'enrol_authorize', '2011112902', '2011112902', 'Upgrade savepoint reached', NULL, '', 0, 1364029064),
(135, 0, 'enrol_authorize', '2011112902', '2011112902', 'Plugin installed', NULL, '', 0, 1364029065),
(136, 0, 'enrol_category', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029065),
(137, 0, 'enrol_category', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029065),
(138, 0, 'enrol_category', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029065),
(139, 0, 'enrol_cohort', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029065),
(140, 0, 'enrol_cohort', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029065),
(141, 0, 'enrol_cohort', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029065),
(142, 0, 'enrol_database', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029065),
(143, 0, 'enrol_database', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029065),
(144, 0, 'enrol_database', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029065),
(145, 0, 'enrol_flatfile', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029065),
(146, 0, 'enrol_flatfile', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029066),
(147, 0, 'enrol_flatfile', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029066),
(148, 0, 'enrol_guest', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029066),
(149, 0, 'enrol_guest', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029066),
(150, 0, 'enrol_guest', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029066),
(151, 0, 'enrol_imsenterprise', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029066),
(152, 0, 'enrol_imsenterprise', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029066),
(153, 0, 'enrol_imsenterprise', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029066),
(154, 0, 'enrol_ldap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029066),
(155, 0, 'enrol_ldap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029066),
(156, 0, 'enrol_ldap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029066),
(157, 0, 'enrol_manual', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029066),
(158, 0, 'enrol_manual', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029066),
(159, 0, 'enrol_manual', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029067),
(160, 0, 'enrol_meta', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029067),
(161, 0, 'enrol_meta', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029067),
(162, 0, 'enrol_meta', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029067),
(163, 0, 'enrol_mnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029067),
(164, 0, 'enrol_mnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029067),
(165, 0, 'enrol_mnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029067),
(166, 0, 'enrol_paypal', NULL, '2011112901', 'Starting plugin installation', NULL, '', 0, 1364029067),
(167, 0, 'enrol_paypal', '2011112901', '2011112901', 'Upgrade savepoint reached', NULL, '', 0, 1364029067),
(168, 0, 'enrol_paypal', '2011112901', '2011112901', 'Plugin installed', NULL, '', 0, 1364029067),
(169, 0, 'enrol_self', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029067),
(170, 0, 'enrol_self', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029067),
(171, 0, 'enrol_self', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029067),
(172, 0, 'message_email', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029068),
(173, 0, 'message_email', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029068),
(174, 0, 'message_email', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029068),
(175, 0, 'message_jabber', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029068),
(176, 0, 'message_jabber', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029068),
(177, 0, 'message_jabber', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029068),
(178, 0, 'message_popup', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029068),
(179, 0, 'message_popup', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029068),
(180, 0, 'message_popup', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029068),
(181, 0, 'block_activity_modules', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029068),
(182, 0, 'block_activity_modules', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(183, 0, 'block_admin_bookmarks', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(184, 0, 'block_admin_bookmarks', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(185, 0, 'block_blog_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(186, 0, 'block_blog_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(187, 0, 'block_blog_recent', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(188, 0, 'block_blog_recent', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(189, 0, 'block_blog_tags', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(190, 0, 'block_blog_tags', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(191, 0, 'block_calendar_month', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(192, 0, 'block_calendar_month', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(193, 0, 'block_calendar_upcoming', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(194, 0, 'block_calendar_upcoming', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(195, 0, 'block_comments', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(196, 0, 'block_comments', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(197, 0, 'block_community', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(198, 0, 'block_community', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(199, 0, 'block_completionstatus', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029069),
(200, 0, 'block_completionstatus', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029069),
(201, 0, 'block_course_list', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(202, 0, 'block_course_list', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029070),
(203, 0, 'block_course_overview', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(204, 0, 'block_course_overview', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029070),
(205, 0, 'block_course_summary', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(206, 0, 'block_course_summary', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029070),
(207, 0, 'block_feedback', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(208, 0, 'block_feedback', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029070),
(209, 0, 'block_glossary_random', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(210, 0, 'block_glossary_random', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029070),
(211, 0, 'block_html', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029070),
(212, 0, 'block_html', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029071),
(213, 0, 'block_login', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029071),
(214, 0, 'block_login', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029071),
(215, 0, 'block_mentees', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029071),
(216, 0, 'block_mentees', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029071),
(217, 0, 'block_messages', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029071),
(218, 0, 'block_messages', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029071),
(219, 0, 'block_mnet_hosts', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029071),
(220, 0, 'block_mnet_hosts', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(221, 0, 'block_myprofile', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(222, 0, 'block_myprofile', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(223, 0, 'block_navigation', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(224, 0, 'block_navigation', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(225, 0, 'block_news_items', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(226, 0, 'block_news_items', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(227, 0, 'block_online_users', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(228, 0, 'block_online_users', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(229, 0, 'block_participants', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(230, 0, 'block_participants', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(231, 0, 'block_private_files', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(232, 0, 'block_private_files', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(233, 0, 'block_quiz_results', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(234, 0, 'block_quiz_results', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(235, 0, 'block_recent_activity', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(236, 0, 'block_recent_activity', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(237, 0, 'block_rss_client', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(238, 0, 'block_rss_client', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029072),
(239, 0, 'block_search_forums', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029072),
(240, 0, 'block_search_forums', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(241, 0, 'block_section_links', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(242, 0, 'block_section_links', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(243, 0, 'block_selfcompletion', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(244, 0, 'block_selfcompletion', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(245, 0, 'block_settings', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(246, 0, 'block_settings', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(247, 0, 'block_site_main_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(248, 0, 'block_site_main_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(249, 0, 'block_social_activities', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(250, 0, 'block_social_activities', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(251, 0, 'block_tag_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(252, 0, 'block_tag_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(253, 0, 'block_tag_youtube', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(254, 0, 'block_tag_youtube', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(255, 0, 'block_tags', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029073),
(256, 0, 'block_tags', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029073),
(257, 0, 'filter_activitynames', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029074),
(258, 0, 'filter_activitynames', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(259, 0, 'filter_activitynames', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029074),
(260, 0, 'filter_algebra', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029074),
(261, 0, 'filter_algebra', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(262, 0, 'filter_algebra', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029074),
(263, 0, 'filter_censor', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029074),
(264, 0, 'filter_censor', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(265, 0, 'filter_censor', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029074),
(266, 0, 'filter_data', NULL, '2011102800', 'Starting plugin installation', NULL, '', 0, 1364029074),
(267, 0, 'filter_data', '2011102800', '2011102800', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(268, 0, 'filter_data', '2011102800', '2011102800', 'Plugin installed', NULL, '', 0, 1364029074),
(269, 0, 'filter_emailprotect', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029074),
(270, 0, 'filter_emailprotect', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(271, 0, 'filter_emailprotect', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029074),
(272, 0, 'filter_emoticon', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029074),
(273, 0, 'filter_emoticon', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(274, 0, 'filter_emoticon', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029074),
(275, 0, 'filter_glossary', NULL, '2011102801', 'Starting plugin installation', NULL, '', 0, 1364029074),
(276, 0, 'filter_glossary', '2011102801', '2011102801', 'Upgrade savepoint reached', NULL, '', 0, 1364029074),
(277, 0, 'filter_glossary', '2011102801', '2011102801', 'Plugin installed', NULL, '', 0, 1364029074),
(278, 0, 'filter_mediaplugin', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(279, 0, 'filter_mediaplugin', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(280, 0, 'filter_mediaplugin', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(281, 0, 'filter_multilang', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(282, 0, 'filter_multilang', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(283, 0, 'filter_multilang', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(284, 0, 'filter_tex', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(285, 0, 'filter_tex', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(286, 0, 'filter_tex', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(287, 0, 'filter_tidy', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(288, 0, 'filter_tidy', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(289, 0, 'filter_tidy', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(290, 0, 'filter_urltolink', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(291, 0, 'filter_urltolink', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(292, 0, 'filter_urltolink', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(293, 0, 'editor_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029075),
(294, 0, 'editor_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029075),
(295, 0, 'editor_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029075),
(296, 0, 'editor_tinymce', NULL, '2012030300', 'Starting plugin installation', NULL, '', 0, 1364029076),
(297, 0, 'editor_tinymce', '2012030300', '2012030300', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(298, 0, 'editor_tinymce', '2012030300', '2012030300', 'Plugin installed', NULL, '', 0, 1364029076),
(299, 0, 'format_scorm', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1364029076),
(300, 0, 'format_scorm', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(301, 0, 'format_scorm', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1364029076),
(302, 0, 'format_social', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1364029076),
(303, 0, 'format_social', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(304, 0, 'format_social', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1364029076),
(305, 0, 'format_topics', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1364029076),
(306, 0, 'format_topics', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(307, 0, 'format_topics', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1364029076),
(308, 0, 'format_weeks', NULL, '2011120100', 'Starting plugin installation', NULL, '', 0, 1364029076),
(309, 0, 'format_weeks', '2011120100', '2011120100', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(310, 0, 'format_weeks', '2011120100', '2011120100', 'Plugin installed', NULL, '', 0, 1364029076),
(311, 0, 'profilefield_checkbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029076),
(312, 0, 'profilefield_checkbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(313, 0, 'profilefield_checkbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029076),
(314, 0, 'profilefield_datetime', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029076),
(315, 0, 'profilefield_datetime', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(316, 0, 'profilefield_datetime', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029076),
(317, 0, 'profilefield_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029076),
(318, 0, 'profilefield_menu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(319, 0, 'profilefield_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029076),
(320, 0, 'profilefield_text', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029076),
(321, 0, 'profilefield_text', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(322, 0, 'profilefield_text', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029076),
(323, 0, 'profilefield_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029076),
(324, 0, 'profilefield_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(325, 0, 'profilefield_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029076),
(326, 0, 'report_backups', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029076),
(327, 0, 'report_backups', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029076),
(328, 0, 'report_backups', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029077),
(329, 0, 'report_completion', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029077),
(330, 0, 'report_completion', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029077),
(331, 0, 'report_completion', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029077),
(332, 0, 'report_configlog', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029077),
(333, 0, 'report_configlog', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029077),
(334, 0, 'report_configlog', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029077),
(335, 0, 'report_courseoverview', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029077),
(336, 0, 'report_courseoverview', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029077),
(337, 0, 'report_courseoverview', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029077),
(338, 0, 'report_log', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(339, 0, 'report_log', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(340, 0, 'report_log', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(341, 0, 'report_loglive', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(342, 0, 'report_loglive', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(343, 0, 'report_loglive', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(344, 0, 'report_outline', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(345, 0, 'report_outline', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(346, 0, 'report_outline', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(347, 0, 'report_participation', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(348, 0, 'report_participation', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(349, 0, 'report_participation', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(350, 0, 'report_progress', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(351, 0, 'report_progress', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(352, 0, 'report_progress', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(353, 0, 'report_questioninstances', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(354, 0, 'report_questioninstances', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(355, 0, 'report_questioninstances', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(356, 0, 'report_security', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029078),
(357, 0, 'report_security', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029078),
(358, 0, 'report_security', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029078),
(359, 0, 'report_stats', NULL, '2011110300', 'Starting plugin installation', NULL, '', 0, 1364029079),
(360, 0, 'report_stats', '2011110300', '2011110300', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(361, 0, 'report_stats', '2011110300', '2011110300', 'Plugin installed', NULL, '', 0, 1364029079),
(362, 0, 'gradeexport_ods', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(363, 0, 'gradeexport_ods', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(364, 0, 'gradeexport_ods', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029079),
(365, 0, 'gradeexport_txt', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(366, 0, 'gradeexport_txt', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(367, 0, 'gradeexport_txt', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029079),
(368, 0, 'gradeexport_xls', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(369, 0, 'gradeexport_xls', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(370, 0, 'gradeexport_xls', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029079),
(371, 0, 'gradeexport_xml', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(372, 0, 'gradeexport_xml', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(373, 0, 'gradeexport_xml', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029079),
(374, 0, 'gradeimport_csv', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(375, 0, 'gradeimport_csv', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(376, 0, 'gradeimport_csv', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029079),
(377, 0, 'gradeimport_xml', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029079),
(378, 0, 'gradeimport_xml', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029079),
(379, 0, 'gradeimport_xml', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029080),
(380, 0, 'gradereport_grader', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029080),
(381, 0, 'gradereport_grader', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029080),
(382, 0, 'gradereport_grader', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029080),
(383, 0, 'gradereport_outcomes', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029080),
(384, 0, 'gradereport_outcomes', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029080),
(385, 0, 'gradereport_outcomes', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029080),
(386, 0, 'gradereport_overview', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029080),
(387, 0, 'gradereport_overview', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029080),
(388, 0, 'gradereport_overview', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029080),
(389, 0, 'gradereport_user', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029080),
(390, 0, 'gradereport_user', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029080),
(391, 0, 'gradereport_user', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029080),
(392, 0, 'gradingform_rubric', NULL, '2011110900', 'Starting plugin installation', NULL, '', 0, 1364029080),
(393, 0, 'gradingform_rubric', '2011110900', '2011110900', 'Upgrade savepoint reached', NULL, '', 0, 1364029081),
(394, 0, 'gradingform_rubric', '2011110900', '2011110900', 'Plugin installed', NULL, '', 0, 1364029081),
(395, 0, 'mnetservice_enrol', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029081),
(396, 0, 'mnetservice_enrol', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029082),
(397, 0, 'mnetservice_enrol', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029082),
(398, 0, 'webservice_amf', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029082),
(399, 0, 'webservice_amf', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029082),
(400, 0, 'webservice_amf', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029082),
(401, 0, 'webservice_rest', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029082),
(402, 0, 'webservice_rest', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029082),
(403, 0, 'webservice_rest', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029082),
(404, 0, 'webservice_soap', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029082),
(405, 0, 'webservice_soap', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029082),
(406, 0, 'webservice_soap', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029082),
(407, 0, 'webservice_xmlrpc', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029082),
(408, 0, 'webservice_xmlrpc', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029082),
(409, 0, 'webservice_xmlrpc', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029082),
(410, 0, 'repository_alfresco', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029082),
(411, 0, 'repository_alfresco', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(412, 0, 'repository_alfresco', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029083),
(413, 0, 'repository_boxnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029083),
(414, 0, 'repository_boxnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(415, 0, 'repository_boxnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029083),
(416, 0, 'repository_coursefiles', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1364029083),
(417, 0, 'repository_coursefiles', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(418, 0, 'repository_coursefiles', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1364029083),
(419, 0, 'repository_dropbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029083),
(420, 0, 'repository_dropbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(421, 0, 'repository_dropbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029083),
(422, 0, 'repository_filesystem', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1364029083),
(423, 0, 'repository_filesystem', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(424, 0, 'repository_filesystem', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1364029083),
(425, 0, 'repository_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029083),
(426, 0, 'repository_flickr', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029083),
(427, 0, 'repository_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029083),
(428, 0, 'repository_flickr_public', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029083),
(429, 0, 'repository_flickr_public', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(430, 0, 'repository_flickr_public', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029084),
(431, 0, 'repository_googledocs', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029084),
(432, 0, 'repository_googledocs', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(433, 0, 'repository_googledocs', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029084),
(434, 0, 'repository_local', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1364029084),
(435, 0, 'repository_local', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(436, 0, 'repository_local', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1364029084),
(437, 0, 'repository_merlot', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029084),
(438, 0, 'repository_merlot', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(439, 0, 'repository_merlot', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029084),
(440, 0, 'repository_picasa', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029084),
(441, 0, 'repository_picasa', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(442, 0, 'repository_picasa', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029084),
(443, 0, 'repository_recent', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029084),
(444, 0, 'repository_recent', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029084),
(445, 0, 'repository_recent', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029084),
(446, 0, 'repository_s3', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029084),
(447, 0, 'repository_s3', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(448, 0, 'repository_s3', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029085),
(449, 0, 'repository_upload', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029085),
(450, 0, 'repository_upload', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(451, 0, 'repository_upload', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029085),
(452, 0, 'repository_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029085),
(453, 0, 'repository_url', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(454, 0, 'repository_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029085),
(455, 0, 'repository_user', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029085),
(456, 0, 'repository_user', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(457, 0, 'repository_user', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029085),
(458, 0, 'repository_webdav', NULL, '2012010100', 'Starting plugin installation', NULL, '', 0, 1364029085),
(459, 0, 'repository_webdav', '2012010100', '2012010100', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(460, 0, 'repository_webdav', '2012010100', '2012010100', 'Plugin installed', NULL, '', 0, 1364029085),
(461, 0, 'repository_wikimedia', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029085),
(462, 0, 'repository_wikimedia', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029085),
(463, 0, 'repository_wikimedia', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029086),
(464, 0, 'repository_youtube', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029086),
(465, 0, 'repository_youtube', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029086),
(466, 0, 'repository_youtube', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029086),
(467, 0, 'portfolio_boxnet', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029086),
(468, 0, 'portfolio_boxnet', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029086),
(469, 0, 'portfolio_boxnet', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029086),
(470, 0, 'portfolio_download', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029086),
(471, 0, 'portfolio_download', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029086),
(472, 0, 'portfolio_download', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029086),
(473, 0, 'portfolio_flickr', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029086),
(474, 0, 'portfolio_flickr', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029086),
(475, 0, 'portfolio_flickr', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029087),
(476, 0, 'portfolio_googledocs', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029087),
(477, 0, 'portfolio_googledocs', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(478, 0, 'portfolio_googledocs', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029087),
(479, 0, 'portfolio_mahara', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029087),
(480, 0, 'portfolio_mahara', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(481, 0, 'portfolio_mahara', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029087);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(482, 0, 'portfolio_picasa', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029087),
(483, 0, 'portfolio_picasa', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(484, 0, 'portfolio_picasa', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029087),
(485, 0, 'qbehaviour_adaptive', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029087),
(486, 0, 'qbehaviour_adaptive', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(487, 0, 'qbehaviour_adaptive', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029087),
(488, 0, 'qbehaviour_adaptivenopenalty', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029087),
(489, 0, 'qbehaviour_adaptivenopenalty', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(490, 0, 'qbehaviour_adaptivenopenalty', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029087),
(491, 0, 'qbehaviour_deferredcbm', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029087),
(492, 0, 'qbehaviour_deferredcbm', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(493, 0, 'qbehaviour_deferredcbm', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029087),
(494, 0, 'qbehaviour_deferredfeedback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029087),
(495, 0, 'qbehaviour_deferredfeedback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029087),
(496, 0, 'qbehaviour_deferredfeedback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(497, 0, 'qbehaviour_immediatecbm', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(498, 0, 'qbehaviour_immediatecbm', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(499, 0, 'qbehaviour_immediatecbm', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(500, 0, 'qbehaviour_immediatefeedback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(501, 0, 'qbehaviour_immediatefeedback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(502, 0, 'qbehaviour_immediatefeedback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(503, 0, 'qbehaviour_informationitem', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(504, 0, 'qbehaviour_informationitem', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(505, 0, 'qbehaviour_informationitem', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(506, 0, 'qbehaviour_interactive', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(507, 0, 'qbehaviour_interactive', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(508, 0, 'qbehaviour_interactive', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(509, 0, 'qbehaviour_interactivecountback', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(510, 0, 'qbehaviour_interactivecountback', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(511, 0, 'qbehaviour_interactivecountback', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(512, 0, 'qbehaviour_manualgraded', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(513, 0, 'qbehaviour_manualgraded', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(514, 0, 'qbehaviour_manualgraded', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(515, 0, 'qbehaviour_missing', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(516, 0, 'qbehaviour_missing', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(517, 0, 'qbehaviour_missing', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029088),
(518, 0, 'qformat_aiken', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029088),
(519, 0, 'qformat_aiken', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029088),
(520, 0, 'qformat_aiken', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029089),
(521, 0, 'qformat_blackboard', NULL, '2011102701', 'Starting plugin installation', NULL, '', 0, 1364029089),
(522, 0, 'qformat_blackboard', '2011102701', '2011102701', 'Upgrade savepoint reached', NULL, '', 0, 1364029089),
(523, 0, 'qformat_blackboard', '2011102701', '2011102701', 'Plugin installed', NULL, '', 0, 1364029089),
(524, 0, 'qformat_blackboard_six', NULL, '2011102701', 'Starting plugin installation', NULL, '', 0, 1364029089),
(525, 0, 'qformat_blackboard_six', '2011102701', '2011102701', 'Upgrade savepoint reached', NULL, '', 0, 1364029089),
(526, 0, 'qformat_blackboard_six', '2011102701', '2011102701', 'Plugin installed', NULL, '', 0, 1364029089),
(527, 0, 'qformat_examview', NULL, '2011102701', 'Starting plugin installation', NULL, '', 0, 1364029089),
(528, 0, 'qformat_examview', '2011102701', '2011102701', 'Upgrade savepoint reached', NULL, '', 0, 1364029089),
(529, 0, 'qformat_examview', '2011102701', '2011102701', 'Plugin installed', NULL, '', 0, 1364029089),
(530, 0, 'qformat_gift', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029089),
(531, 0, 'qformat_gift', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029089),
(532, 0, 'qformat_gift', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029089),
(533, 0, 'qformat_learnwise', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029089),
(534, 0, 'qformat_learnwise', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029089),
(535, 0, 'qformat_learnwise', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029089),
(536, 0, 'qformat_missingword', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029089),
(537, 0, 'qformat_missingword', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029090),
(538, 0, 'qformat_missingword', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029090),
(539, 0, 'qformat_multianswer', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029090),
(540, 0, 'qformat_multianswer', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029090),
(541, 0, 'qformat_multianswer', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029090),
(542, 0, 'qformat_webct', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029090),
(543, 0, 'qformat_webct', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029090),
(544, 0, 'qformat_webct', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029090),
(545, 0, 'qformat_xhtml', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029090),
(546, 0, 'qformat_xhtml', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029090),
(547, 0, 'qformat_xhtml', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029090),
(548, 0, 'qformat_xml', NULL, '2011102700', 'Starting plugin installation', NULL, '', 0, 1364029090),
(549, 0, 'qformat_xml', '2011102700', '2011102700', 'Upgrade savepoint reached', NULL, '', 0, 1364029091),
(550, 0, 'qformat_xml', '2011102700', '2011102700', 'Plugin installed', NULL, '', 0, 1364029091),
(551, 0, 'tool_bloglevelupgrade', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029091),
(552, 0, 'tool_bloglevelupgrade', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029091),
(553, 0, 'tool_bloglevelupgrade', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029091),
(554, 0, 'tool_capability', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029092),
(555, 0, 'tool_capability', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029092),
(556, 0, 'tool_capability', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029092),
(557, 0, 'tool_customlang', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029092),
(558, 0, 'tool_customlang', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029092),
(559, 0, 'tool_customlang', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029093),
(560, 0, 'tool_dbtransfer', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029093),
(561, 0, 'tool_dbtransfer', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029093),
(562, 0, 'tool_dbtransfer', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029093),
(563, 0, 'tool_generator', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029093),
(564, 0, 'tool_generator', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029093),
(565, 0, 'tool_generator', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029093),
(566, 0, 'tool_health', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029093),
(567, 0, 'tool_health', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029093),
(568, 0, 'tool_health', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029094),
(569, 0, 'tool_innodb', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029094),
(570, 0, 'tool_innodb', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029094),
(571, 0, 'tool_innodb', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029094),
(572, 0, 'tool_langimport', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029094),
(573, 0, 'tool_langimport', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029094),
(574, 0, 'tool_langimport', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029094),
(575, 0, 'tool_multilangupgrade', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029094),
(576, 0, 'tool_multilangupgrade', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029094),
(577, 0, 'tool_multilangupgrade', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029094),
(578, 0, 'tool_profiling', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029094),
(579, 0, 'tool_profiling', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029094),
(580, 0, 'tool_profiling', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029094),
(581, 0, 'tool_qeupgradehelper', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029094),
(582, 0, 'tool_qeupgradehelper', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(583, 0, 'tool_qeupgradehelper', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(584, 0, 'tool_replace', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(585, 0, 'tool_replace', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(586, 0, 'tool_replace', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(587, 0, 'tool_spamcleaner', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(588, 0, 'tool_spamcleaner', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(589, 0, 'tool_spamcleaner', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(590, 0, 'tool_timezoneimport', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(591, 0, 'tool_timezoneimport', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(592, 0, 'tool_timezoneimport', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(593, 0, 'tool_unittest', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(594, 0, 'tool_unittest', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(595, 0, 'tool_unittest', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(596, 0, 'tool_unsuproles', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(597, 0, 'tool_unsuproles', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(598, 0, 'tool_unsuproles', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(599, 0, 'tool_uploaduser', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029095),
(600, 0, 'tool_uploaduser', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029095),
(601, 0, 'tool_uploaduser', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029095),
(602, 0, 'tool_xmldb', NULL, '2011092500', 'Starting plugin installation', NULL, '', 0, 1364029096),
(603, 0, 'tool_xmldb', '2011092500', '2011092500', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(604, 0, 'tool_xmldb', '2011092500', '2011092500', 'Plugin installed', NULL, '', 0, 1364029096),
(605, 0, 'theme_afterburner', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(606, 0, 'theme_afterburner', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(607, 0, 'theme_afterburner', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(608, 0, 'theme_anomaly', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(609, 0, 'theme_anomaly', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(610, 0, 'theme_anomaly', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(611, 0, 'theme_arialist', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(612, 0, 'theme_arialist', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(613, 0, 'theme_arialist', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(614, 0, 'theme_base', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(615, 0, 'theme_base', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(616, 0, 'theme_base', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(617, 0, 'theme_binarius', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(618, 0, 'theme_binarius', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(619, 0, 'theme_binarius', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(620, 0, 'theme_boxxie', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(621, 0, 'theme_boxxie', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(622, 0, 'theme_boxxie', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029096),
(623, 0, 'theme_brick', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029096),
(624, 0, 'theme_brick', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029096),
(625, 0, 'theme_brick', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(626, 0, 'theme_canvas', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(627, 0, 'theme_canvas', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(628, 0, 'theme_canvas', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(629, 0, 'theme_formal_white', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(630, 0, 'theme_formal_white', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(631, 0, 'theme_formal_white', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(632, 0, 'theme_formfactor', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(633, 0, 'theme_formfactor', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(634, 0, 'theme_formfactor', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(635, 0, 'theme_fusion', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(636, 0, 'theme_fusion', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(637, 0, 'theme_fusion', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(638, 0, 'theme_leatherbound', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(639, 0, 'theme_leatherbound', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(640, 0, 'theme_leatherbound', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(641, 0, 'theme_magazine', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(642, 0, 'theme_magazine', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(643, 0, 'theme_magazine', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(644, 0, 'theme_mymobile', NULL, '2011101801', 'Starting plugin installation', NULL, '', 0, 1364029097),
(645, 0, 'theme_mymobile', '2011101801', '2011101801', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(646, 0, 'theme_mymobile', '2011101801', '2011101801', 'Plugin installed', NULL, '', 0, 1364029097),
(647, 0, 'theme_nimble', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(648, 0, 'theme_nimble', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029097),
(649, 0, 'theme_nimble', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029097),
(650, 0, 'theme_nonzero', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029097),
(651, 0, 'theme_nonzero', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(652, 0, 'theme_nonzero', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(653, 0, 'theme_overlay', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(654, 0, 'theme_overlay', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(655, 0, 'theme_overlay', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(656, 0, 'theme_serenity', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(657, 0, 'theme_serenity', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(658, 0, 'theme_serenity', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(659, 0, 'theme_sky_high', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(660, 0, 'theme_sky_high', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(661, 0, 'theme_sky_high', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(662, 0, 'theme_splash', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(663, 0, 'theme_splash', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(664, 0, 'theme_splash', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(665, 0, 'theme_standard', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(666, 0, 'theme_standard', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(667, 0, 'theme_standard', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(668, 0, 'theme_standardold', NULL, '2011082400', 'Starting plugin installation', NULL, '', 0, 1364029098),
(669, 0, 'theme_standardold', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(670, 0, 'theme_standardold', '2011082400', '2011082400', 'Plugin installed', NULL, '', 0, 1364029098),
(671, 0, 'assignment_offline', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029098),
(672, 0, 'assignment_offline', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(673, 0, 'assignment_offline', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029098),
(674, 0, 'assignment_online', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029098),
(675, 0, 'assignment_online', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029098),
(676, 0, 'assignment_online', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029099),
(677, 0, 'assignment_upload', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029099),
(678, 0, 'assignment_upload', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029099),
(679, 0, 'assignment_upload', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029099),
(680, 0, 'assignment_uploadsingle', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029099),
(681, 0, 'assignment_uploadsingle', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029099),
(682, 0, 'assignment_uploadsingle', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029099),
(683, 0, 'datafield_checkbox', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029099),
(684, 0, 'datafield_checkbox', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029099),
(685, 0, 'datafield_checkbox', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029099),
(686, 0, 'datafield_date', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029099),
(687, 0, 'datafield_date', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029099),
(688, 0, 'datafield_date', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029099),
(689, 0, 'datafield_file', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029099),
(690, 0, 'datafield_file', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029099),
(691, 0, 'datafield_file', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(692, 0, 'datafield_latlong', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(693, 0, 'datafield_latlong', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(694, 0, 'datafield_latlong', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(695, 0, 'datafield_menu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(696, 0, 'datafield_menu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(697, 0, 'datafield_menu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(698, 0, 'datafield_multimenu', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(699, 0, 'datafield_multimenu', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(700, 0, 'datafield_multimenu', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(701, 0, 'datafield_number', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(702, 0, 'datafield_number', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(703, 0, 'datafield_number', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(704, 0, 'datafield_picture', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(705, 0, 'datafield_picture', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(706, 0, 'datafield_picture', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(707, 0, 'datafield_radiobutton', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(708, 0, 'datafield_radiobutton', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(709, 0, 'datafield_radiobutton', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029100),
(710, 0, 'datafield_text', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029100),
(711, 0, 'datafield_text', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029100),
(712, 0, 'datafield_text', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029101),
(713, 0, 'datafield_textarea', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029101),
(714, 0, 'datafield_textarea', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029101),
(715, 0, 'datafield_textarea', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029101),
(716, 0, 'datafield_url', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029101),
(717, 0, 'datafield_url', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029101),
(718, 0, 'datafield_url', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029101),
(719, 0, 'datapreset_imagegallery', NULL, '2011112900', 'Starting plugin installation', NULL, '', 0, 1364029101),
(720, 0, 'datapreset_imagegallery', '2011112900', '2011112900', 'Upgrade savepoint reached', NULL, '', 0, 1364029101),
(721, 0, 'datapreset_imagegallery', '2011112900', '2011112900', 'Plugin installed', NULL, '', 0, 1364029101),
(722, 0, 'quiz_grading', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1364029101),
(723, 0, 'quiz_grading', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1364029101),
(724, 0, 'quiz_grading', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1364029101),
(725, 0, 'quiz_overview', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1364029101),
(726, 0, 'quiz_overview', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1364029101),
(727, 0, 'quiz_overview', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1364029101),
(728, 0, 'quiz_responses', NULL, '2011051200', 'Starting plugin installation', NULL, '', 0, 1364029102),
(729, 0, 'quiz_responses', '2011051200', '2011051200', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(730, 0, 'quiz_responses', '2011051200', '2011051200', 'Plugin installed', NULL, '', 0, 1364029102),
(731, 0, 'quiz_statistics', NULL, '2011122300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(732, 0, 'quiz_statistics', '2011122300', '2011122300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(733, 0, 'quiz_statistics', '2011122300', '2011122300', 'Plugin installed', NULL, '', 0, 1364029102),
(734, 0, 'quizaccess_delaybetweenattempts', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(735, 0, 'quizaccess_delaybetweenattempts', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(736, 0, 'quizaccess_delaybetweenattempts', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(737, 0, 'quizaccess_ipaddress', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(738, 0, 'quizaccess_ipaddress', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(739, 0, 'quizaccess_ipaddress', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(740, 0, 'quizaccess_numattempts', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(741, 0, 'quizaccess_numattempts', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(742, 0, 'quizaccess_numattempts', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(743, 0, 'quizaccess_openclosedate', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(744, 0, 'quizaccess_openclosedate', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(745, 0, 'quizaccess_openclosedate', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(746, 0, 'quizaccess_password', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(747, 0, 'quizaccess_password', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(748, 0, 'quizaccess_password', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(749, 0, 'quizaccess_safebrowser', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(750, 0, 'quizaccess_safebrowser', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(751, 0, 'quizaccess_safebrowser', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(752, 0, 'quizaccess_securewindow', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(753, 0, 'quizaccess_securewindow', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(754, 0, 'quizaccess_securewindow', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(755, 0, 'quizaccess_timelimit', NULL, '2011092300', 'Starting plugin installation', NULL, '', 0, 1364029102),
(756, 0, 'quizaccess_timelimit', '2011092300', '2011092300', 'Upgrade savepoint reached', NULL, '', 0, 1364029102),
(757, 0, 'quizaccess_timelimit', '2011092300', '2011092300', 'Plugin installed', NULL, '', 0, 1364029102),
(758, 0, 'scormreport_basic', NULL, '2011071100', 'Starting plugin installation', NULL, '', 0, 1364029103),
(759, 0, 'scormreport_basic', '2011071100', '2011071100', 'Upgrade savepoint reached', NULL, '', 0, 1364029103),
(760, 0, 'scormreport_basic', '2011071100', '2011071100', 'Plugin installed', NULL, '', 0, 1364029103),
(761, 0, 'scormreport_interactions', NULL, '2011110100', 'Starting plugin installation', NULL, '', 0, 1364029103),
(762, 0, 'scormreport_interactions', '2011110100', '2011110100', 'Upgrade savepoint reached', NULL, '', 0, 1364029103),
(763, 0, 'scormreport_interactions', '2011110100', '2011110100', 'Plugin installed', NULL, '', 0, 1364029103),
(764, 0, 'workshopform_accumulative', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1364029103),
(765, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1364029103),
(766, 0, 'workshopform_accumulative', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1364029103),
(767, 0, 'workshopform_comments', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1364029103),
(768, 0, 'workshopform_comments', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1364029103),
(769, 0, 'workshopform_comments', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1364029103),
(770, 0, 'workshopform_numerrors', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1364029103),
(771, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1364029104),
(772, 0, 'workshopform_numerrors', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1364029104),
(773, 0, 'workshopform_rubric', NULL, '2010091700', 'Starting plugin installation', NULL, '', 0, 1364029104),
(774, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Upgrade savepoint reached', NULL, '', 0, 1364029104),
(775, 0, 'workshopform_rubric', '2010091700', '2010091700', 'Plugin installed', NULL, '', 0, 1364029104),
(776, 0, 'workshopallocation_manual', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1364029104),
(777, 0, 'workshopallocation_manual', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1364029104),
(778, 0, 'workshopallocation_manual', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1364029104),
(779, 0, 'workshopallocation_random', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1364029104),
(780, 0, 'workshopallocation_random', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1364029104),
(781, 0, 'workshopallocation_random', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1364029104),
(782, 0, 'workshopeval_best', NULL, '2010090501', 'Starting plugin installation', NULL, '', 0, 1364029104),
(783, 0, 'workshopeval_best', '2010090501', '2010090501', 'Upgrade savepoint reached', NULL, '', 0, 1364029104),
(784, 0, 'workshopeval_best', '2010090501', '2010090501', 'Plugin installed', NULL, '', 0, 1364029104),
(785, 0, 'theme_pristine', NULL, '2011082400', 'Starting plugin installation', NULL, '', 2, 1364035777),
(786, 0, 'theme_pristine', '2011082400', '2011082400', 'Upgrade savepoint reached', NULL, '', 2, 1364035777),
(787, 0, 'theme_pristine', '2011082400', '2011082400', 'Plugin installed', NULL, '', 2, 1364035777);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `externalurl` text NOT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `parameters` text,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_url`
--

INSERT INTO `mdl_url` (`id`, `course`, `name`, `intro`, `introformat`, `externalurl`, `display`, `displayoptions`, `parameters`, `timemodified`) VALUES
(1, 2, 'Bond Features, Coupon Structures, Floating Rate Securities', '<h2 id="pageheading" class="main">Bond Features, Coupon Structures, Floating Rate Securities</h2>', 1, 'http://www.arteclab.uni-bremen.de/Projects/marvel/fileadmin/templates/MARVEL/documents/2005-06-rev05-FEUP.pdf', 0, 'a:2:{s:12:"printheading";i:0;s:10:"printintro";i:1;}', 'a:0:{}', 1364196954),
(2, 2, 'Bond Indenture, Affirmative and Negative Convenants', '<div id="intro" class="box generalbox">\r\n<div class="no-overflow">\r\n<h2 id="pageheading" class="main">Bond Indenture, Affirmative and Negative Convenants</h2>\r\n<div></div>\r\n</div>\r\n</div>', 1, 'http://moodle.njit.edu/tutorials/students/upload_assignment.pdf', 0, 'a:2:{s:12:"printheading";i:0;s:10:"printintro";i:1;}', 'a:0:{}', 1364197137),
(3, 2, 'Description of CFAI Professional Conduct Program', '<div id="intro" class="box generalbox">\r\n<div class="no-overflow">\r\n<h2 id="pageheading" class="main">Description of CFAI Professional Conduct Program</h2>\r\n<div></div>\r\n</div>\r\n</div>', 1, 'http://llt.msu.edu/vol9num2/pdf/review1.pdf', 0, 'a:2:{s:12:"printheading";i:0;s:10:"printintro";i:1;}', 'a:0:{}', 1364197208),
(4, 2, 'Basics of Code of Ethics and Professional Standards', '<div id="intro" class="box generalbox">\r\n<div class="no-overflow">\r\n<h2 id="pageheading" class="main">Basics of Code of Ethics and Professional Standards</h2>\r\n<div></div>\r\n</div>\r\n</div>', 1, 'http://bullyingcourse.com/file.php/1/Moodle_Manual_for_Students.pdf', 0, 'a:2:{s:12:"printheading";i:0;s:10:"printintro";i:1;}', 'a:0:{}', 1364197243);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(40) NOT NULL DEFAULT '',
  `department` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(70) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ajax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `screenreader` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `ajax`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `screenreader`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '215b58c0c5a570c57350a8cda8a37eb9', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 0, 1, 0, 2, 1, 1, 1, 0, 0, 1364029010, 0, NULL, 0),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '34f3f9c483f36e9ca1ce554d270be348', '', 'Admin', 'User', 'ankit@eneev.com', 0, '', '', '', '', '', '', '', '', '', '', 'bombay', 'IN', 'en', '', '99', 1364029177, 1364202577, 1364191944, 1364202577, '127.0.0.1', '', 0, '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1364029233, 0, NULL, 0),
(3, 'manual', 1, 0, 0, 0, 1, 'pristine', '34f3f9c483f36e9ca1ce554d270be348', '', 'pristine', 'education', 'amit@eneev.com', 0, '', '', '', '', '', '', '', '', '', '', 'mum', 'IN', 'en', '', '99', 1364201917, 1364203219, 0, 1364201917, '127.0.0.1', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1, 0, 1364197630, 1364197630, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enrolid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 2, 1363977000, 0, 2, 1364029341, 1364029341),
(2, 0, 4, 2, 1363977000, 0, 2, 1364029702, 1364029702),
(3, 0, 1, 3, 1364149800, 0, 2, 1364197737, 1364197737),
(4, 0, 4, 3, 1364149800, 0, 2, 1364197743, 1364197743);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) unsigned NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `signup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1364201643),
(2, 2, 3, 1364201641),
(3, 3, 3, 1364202301),
(4, 3, 2, 1364203219);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'email_bounce_count', '1'),
(2, 2, 'email_send_count', '1'),
(3, 3, 'auth_forcepasswordchange', '0'),
(4, 3, 'email_bounce_count', '1'),
(5, 3, 'email_send_count', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) unsigned DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recursive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` mediumtext,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `editbegin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `editend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `frompageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `topageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lockedat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` mediumtext NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timerendered` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL,
  `phase` smallint(3) unsigned DEFAULT '0',
  `useexamples` tinyint(2) unsigned DEFAULT '0',
  `usepeerassessment` tinyint(2) unsigned DEFAULT '0',
  `useselfassessment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) unsigned DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) unsigned DEFAULT '0',
  `nattachments` smallint(3) unsigned DEFAULT '0',
  `latesubmissions` tinyint(2) unsigned DEFAULT '0',
  `maxbytes` bigint(10) unsigned DEFAULT '100000',
  `examplesmode` smallint(3) unsigned DEFAULT '0',
  `submissionstart` bigint(10) unsigned DEFAULT '0',
  `submissionend` bigint(10) unsigned DEFAULT '0',
  `assessmentstart` bigint(10) unsigned DEFAULT '0',
  `assessmentend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `comparison` smallint(3) unsigned DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `descriptiontrust` bigint(10) unsigned DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `nonegative` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) unsigned NOT NULL,
  `reviewerid` bigint(10) unsigned NOT NULL,
  `weight` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timegraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) unsigned NOT NULL DEFAULT '0',
  `mailed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `resubmission` smallint(3) unsigned NOT NULL DEFAULT '0',
  `donotuse` smallint(3) unsigned NOT NULL DEFAULT '0',
  `generalcomment` text,
  `teachercomment` text,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `scale` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxscore` smallint(3) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(3) unsigned NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) unsigned NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` text NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `wtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nelements` smallint(3) unsigned NOT NULL DEFAULT '1',
  `nattachments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `phase` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `includeself` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) unsigned NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `overallocation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) unsigned NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rubricno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `example` tinyint(2) unsigned DEFAULT '0',
  `authorid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) unsigned NOT NULL DEFAULT '0',
  `attachment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  `published` tinyint(2) unsigned DEFAULT '0',
  `late` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `gradinggrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nassessments` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
