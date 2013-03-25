<?php
include_once('connect.php');
function progress($courseID, $userID) {
//Query 1 ----- gives marks achieved, Total quizes in course and completed quized
$quer="SELECT a.quiz, a.sumgrades, b.id FROM mdl_quiz_attempts a, mdl_quiz b WHERE b.course=$courseID AND a.userid=$userID AND a.quiz=b.id";
$resourc=mysql_query($quer);
$sum=0;
$done=array();
$total=array();
$quer2="SELECT * FROM `mdl_quiz` WHERE course=$courseID";
$resourc2=mysql_query($quer2);
while ($row = @mysql_fetch_array($resourc)) {
    $sum = $sum + $row['sumgrades'];
    $done[] = $row['id'];
    }
while($row = @mysql_fetch_array($resourc2)) {
    $total[] = $row['id'];
    }
if(count($done)>0) {
    $doneQuizes = count($done);
    $totalQuizes=count($total);
    $marks = $sum;
} elseif((count($done)==0) && (count($total)>0)) {                         // for the case of no quizes defined in the course
    $totalQuizes=count($total);
    $doneQuizes=0;
    $marks = 0;
} else {
    $totalQuizes=0;
    $doneQuizes=0;
    $marks = 0;
}
//Query 2 ---- gives total and viewed resources


$quer="SELECT id FROM `mdl_page` WHERE course=$courseID";
$resourc=mysql_query($quer);
$videos=array();
while ($row = @mysql_fetch_array($resourc)) {
    $videos[] = $row['id'];
}
$totalVids = count($videos);

$quer="SELECT id FROM `mdl_resource` WHERE course=$courseID";
$resourc=mysql_query($quer);
$total=array();
while ($row = @mysql_fetch_array($resourc)) {
    $total[] = $row['id'];
}

$quer="SELECT cmid,module,info FROM `mdl_log` WHERE (module='page'OR module='resource') AND action='view' AND course=$courseID AND userid=$userID";
$resourc=mysql_query($quer);
$done_videos=array();
$done=array();
while ($row = @mysql_fetch_array($resourc)) {
    $cmId = $row['cmid'];
    $type_res = $row['module'];
    if($type_res=='page') {
        $done_videos[] = $cmId;
    } elseif($type_res=='resource') {
        $done[]  = $cmId;
    }
}

$quer="SELECT DISTINCT module,cmid,info FROM `mdl_log` WHERE (module='resource' OR module='page') AND course=$courseID AND userid=$userID AND action='view'";
$resourc=mysql_query($quer);
//$topic_modules_done=array();
$topic_url_done=array();
//$topic_info_done=array();
while ($row = @mysql_fetch_array($resourc)) {
    $topic_url_done[] = $row['cmid'];
}
$doneVids = count(array_unique($done_videos));
$totalResources = count($total);
$doneResources = count(array_unique($done));
if($totalResources+$totalQuizes+$totalVids>0) {
    $percentProg = round(($doneResources+$doneQuizes+$doneVids)*100/($totalResources+$totalQuizes+$totalVids));
}
if($totalResources+$totalQuizes+$totalVids==0) {
    $percentProg=0;
}

//Find total topics and their sequence list
$quer="SELECT section,sequence FROM `mdl_course_sections` WHERE course=$courseID";
$resourc=mysql_query($quer);
$section=array();
$sequence=array();
while ($row = @mysql_fetch_array($resourc)) {
    if (!$row['sequence']) {
        break;
    }
    $section[] = $row['section'];
    $sequence[] = $row['sequence'];
}
$nTopics = count($section);


$quer = "SELECT a.courseid, c.fullname,b.userid FROM mdl_enrol a, mdl_user_enrolments b, mdl_course c WHERE a.id=b.enrolid AND a.status=b.status AND c.id=a.courseid AND a.courseid=$courseID";
$resourc=mysql_query($quer);
$number_of_actual_users = mysql_num_rows($resourc);

//non zero quiz attampts from the courseid,userid
$quer = "SELECT DISTINCT a.cmid,b.userid,b.sumgrades FROM mdl_log a, mdl_quiz_attempts b WHERE a.course=$courseID AND a.module='quiz' AND action='view' AND b.quiz=a.info";
$resourc=mysql_query($quer);
$quizMarks=array();
$user_quizMarks=array();
$cmid_quizMarks=array();
while ($row = @mysql_fetch_array($resourc)) {
    $quizMarks[] = $row['sumgrades'];
    $user_quizMarks[] = $row['userid'];
    $cmid_quizMarks[] = $row['cmid'];
}
for($k=0;$k<count($quizMarks);$k++) {
    if($user_quizMarks[$k]==$userID) {
        $topic_url_done[] = $cmid_quizMarks[$k];
        //$topic_modules_done[] = 'quiz';
    }
}
$completedTopics = 0;
for($i=0;$i<$nTopics;$i++) {
    $list_of_resources = explode(',',$sequence[$i]);
    $xalo = 1;
    for($j=0;$j<count($list_of_resources);$j++) {
        if(!in_array($list_of_resources[$j],$topic_url_done)) {
            $xalo=0 ;
    	}
    } 
    if($xalo==1) {
        $completedTopics = $completedTopics + 1;
    }

//calculate rank now
}
$list_of_users=array_unique($user_quizMarks);   //this is list of users who have non zero marksin this course, users who havent given any quiz or are at zero gross score not in the list
$gross_scores_all = @array_fill(0,count($list_of_users),0);
$list_of_users = array_values($list_of_users);
for($i=0;$i<count($user_quizMarks);$i++) {
    $user_key = array_search($user_quizMarks[$i],$list_of_users);
    $gross_scores_all[$user_key] = $gross_scores_all[$user_key] + $quizMarks[$i];
}

$key=array_search($userID,$list_of_users);
$user_marks = $gross_scores_all[$key];
$sort_flag = @rsort($gross_scores_all);
$ranking = @array_search($user_marks,$gross_scores_all) + 1;
$total_users = count($list_of_users);
$nTopics = $nTopics - 1;
return array($completedTopics,$nTopics,$doneVids,$totalVids, $doneQuizes,$totalQuizes,$marks,$percentProg,$ranking,$number_of_actual_users);
}
// ---- Query for getting lsit of courseIDs for a particular userID
$name=$CFG->dbname;
$usr=$CFG->dbuser;
$pass=$CFG->dbpass;
$host=$CFG->dbhost;
$moodl_lnk=connectB($name,$usr,$pass,$host);
$userID = $USER->id;
$quer="SELECT a.courseid, c.fullname,c.forum_id FROM mdl_enrol a, mdl_user_enrolments b, mdl_course c WHERE a.id=b.enrolid AND a.status=b.status AND b.userid=$userID AND c.id=a.courseid";
$resourc=mysql_query($quer);
$cours=array();
$courseName=array();
$forum_id = array();

while ($row = mysql_fetch_array($resourc)) {
    $cours[] = $row['courseid'];
    $courseName[] =  $row['fullname'];
    $forum_id_list[] = $row['forum_id'];
}
$bleh=$cours;
$nCourses = count($cours);
?>

<!-- <link rel="stylesheet" href="c_list.css" media="all" /> -->
<link rel="stylesheet" href="../css/styles.css" media="all" />
<!-- <script type="text/javascript" src="../js/Tab_jquery.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $(".tabLink").each(function(){
      $(this).click(function(){
        tabeId = $(this).attr('id');
        $(".tabLink").removeClass("activeLink");
        $(this).addClass("activeLink");
        $(".tabcontent").addClass("hide");
        $("#"+tabeId+"-1").removeClass("hide")   
        return false;	  
      });
    });  
  });
</script> -->

    	<div class="row">
                	<h2 class="H2Header" id="tour1">My Courses (<?php echo $nCourses ?>)</h2>
&#160;
 <?php


function suggestion($cID, $userID)  {
$quer="SELECT b.userid,b.readings, b.readings_url, b.tests,b.tests_url FROM mdl_enrol a, mdl_user_enrolments b WHERE a.id=b.enrolid AND b.userid=$userID AND a.courseid=$cID";
$resourc=mysql_query($quer);
while($row=mysql_fetch_array($resourc)) {
    $reading = $row['readings'];
    $rUrl = $row['readings_url'];
    $tests = $row['tests'];
    $tUrl = $row['tests_url'];
}
if(!$reading) {
$reading='No Resources available';
$reading_url='';
}
if(!$tests) {
$tests='No further quizes pending';
$tests_url='';

}
return array($reading,$tests, $rUrl, $tUrl);
}

function printrow($i,$cours,$courseName,$userID,$datab) {
echo "<div class='Course_Main'>";
$cID = $cours[$i];
$perf = progress($cID, $userID); 
echo "<div class='course_div'>";
echo "<a href=$datab/course/view.php?id=$cID> <h3>" . $courseName[$i] . "</h3></a> ";
if($i==0) {
    $tour = 'id=tour2';
} else {
    $tour = '';
} 
echo "<table $tour style='width:100%;'><tr height='25px'><td width='20%' class='course_SubHead'> Topics Completed  &nbsp; &nbsp; </td><td width='10%' class='course_Content'> <span>" . $perf[0] . "</span>/" . $perf[1] . "</td><td width='20%' class='course_SubHead'> Gross Score &nbsp; &nbsp;</td><td width='25%' class='course_Content'><span>" . $perf[6] . "</span></td><td width='25%' align='center' valign='middle' class='course_Content'> <span style='font-size: 13px;'>" . $perf[7] . "%</span> complete </td></tr>";
echo "<tr height='25px'><td width='20%' class='course_SubHead'>Videos Watched &nbsp; &nbsp;</td><td width='10%' class='course_Content'> <span>" . $perf[2] . "</span>/" . $perf[3] . "</span></td><td width='20%' class='course_SubHead'>Tests Taken &nbsp; &nbsp;</td><td width='25%' class='course_Content'><span>" . $perf[4] . "</span>/" . $perf[5] . "</td>";
echo "<td><div style='float:left;background:#cccccc;height:12px;width:150px;'> <div style='float:left;background:green;height:12px;width:" . $perf[7] . "%;z-index:100;'></div></div> </td></tr>";
// $nxt = suggestion($cID, $userID); 
$nxt = array(
    1 => '&nbsp',
    0 => '&nbsp',
    2 => '&nbsp',
    3 => '&nbsp',
);
//if($perf[7]>0) {
//$imagex = 'continue';
//} else {
//$imagex = 'start';
//}
echo "<tr class='continue_bar'> <td  height='35px' valign='middle' class='course_SubHead'>&nbsp;   </td><td> <a href=$nxt[2]> $nxt[0] </a>  <a href=$nxt[3]> $nxt[1] </a>  </td>
  <td colspan='2' align='right'  height='35px' valign='middle' > <a  href= '$datab/course/view.php?id=$cID&display=quiz' class='BlueButton'> Quiz </a> </td>
<td align='right'><a href= '$datab/course/view.php?id=$cID/' class='BlueButton' style='margin-right: 35px;'> Video</a>
</td></tr></table>";
echo "</div>"; 
echo "</div>";
}

$datab=$CFG->wwwroot;
for($i=0; $i<$nCourses; $i++) {
        printrow($i,$cours,$courseName,$userID,$datab);
}
disconnect($moodl_lnk);
echo "</div> </div>";
 //////////////////////// Forum Addition //////////////
/// Ankit Mittal 9th July, 2012 ////
if($USER->id==2) {
   $checkadmin=1;
} else {
   $checkadmin=0;
}

if(!$checkadmin) {
require_once('connect.php');
$qrr = "";
$bloo = sort($forum_id_list);
$phpbblink = connectB('phpbb',$usr,$pass,$host);
for($i=0;$i<count($forum_id_list);$i++) {
    $qrr = $qrr . $forum_id_list[$i] . ",";
} 
$qrr = substr($qrr, 0, -1);  //remove an extra comma from end
 $quer="SELECT a.forum_name,a.forum_id,b.topic_id,b.topic_title,b.topic_last_poster_name,b.topic_last_post_time, b.topic_views,b.topic_replies FROM phpbb_forums a, phpbb_topics b WHERE a.forum_id=b.forum_id AND b.forum_id IN(" . $qrr . " ) ORDER BY a.forum_id, b.topic_last_post_time DESC";

$resourc=mysql_query($quer);
$topic_id = array();
$topic_title = array();
$poster_name = array();
$poster_time = array();
//$poster_id = array();
$topic_views = array();
$topic_replies = array();
$forum_name = array();
$forum_id = array();
while ($row = mysql_fetch_array($resourc)) {
    $topic_id[] = $row['topic_id'];
    $topic_title[] = $row['topic_title'];
    $forum_name[] = $row['forum_name'];
    $forum_id[] = $row['forum_id'];
  //  $poster_id[] = $row['user_id'];
    $poster_name[] = $row['topic_last_poster_name'];
    $poster_time[] = date('jS \of F Y', $row['topic_last_post_time']);
    $topic_views[] = $row['topic_views'];
    $topic_replies[] = $row['topic_replies'];
}
echo "<p>&nbsp;</p> <br>"; ?>

 <div class='tab-box'> 
    <a href='javascript:;' class='tabLink activeLink' id='cont-1'>My Forum</a> 
    <a href='javascript:;' class='tabLink ' id='cont-2'>My Posts</a> 
  </div>
   <div class='tabcontent' id='cont-1-1'> 
    <?php
	
$indx = array();
for($k=0;$k<count($forum_id_list);$k++) {
    $fid = array_search($forum_id_list[$k],$forum_id); 
    if(is_numeric($fid)) {
        $indx[] = $fid;
    }
}
$end_index = array();
for($k=0;$k < count($indx) - 1;$k++) {
    $end_index[] = min($indx[$k]+4,$indx[$k+1]);
}    
$end_index[] = min($indx[count($indx)-1]+4,count($topic_id));
echo "<table border='0' width='100%'> ";

for($k=0;$k<count($indx);$k++) {
    $this_forum_name = $forum_name[$indx[$k]];
    $forum_url_primer = strtolower(str_replace(' ','-',$this_forum_name));
    $forum_url = "http://www.edupristine.com/discuss/" . $forum_url_primer . "-f" . $forum_id[$indx[$k]] . "/";
//    echo "<a href=$forum_url style='color:grey !important;>$this_forum_name</a>";
    echo "<tr><td colspan='3'><a href=$forum_url > <h4> $this_forum_name </h4> </a> </td>";
    for($j=$indx[$k];$j<$end_index[$k];$j++) {
        $topic_url = "http://www.edupristine.com/discuss/topic" . $topic_id[$j] . ".html";
        echo "<tr> <td width='70%'> <a href=$topic_url><h3>$topic_title[$j]</h3> </a> </td> ";
        echo "<td width='15%' style='color:grey;'> <span class='Reply_No'> $topic_replies[$j]</span> replies </td> <td width='15%' style='color:grey;'> <span class='Views_No'> $topic_views[$j] </span> views </td>";
     //   $postrName = str_replace('.','-',$poster_name[$j]);
    //    $poster_url = "http://www.edupristine.com/discuss/" . $postrName . "-u" . $poster_id[$j] . "/";
        echo "<tr> <td colspan='3'><table width='60%'><tr><td width=50% class='Post_Detail'> Posted on $poster_time[$j]</td><td width='5%' class='Post_Detail'> by </td><td class='Post_Name'> $poster_name[$j] </td></tr> </table></td></tr>";

    }
echo "<tr> <td colspan ='3'> <hr style='color:grey; border:dashed;border-width:1px 0 0 0;'></td></tr>";
}  
echo "</table>";
	
	?> 
  </div>
  
  <div class='tabcontent hide' id='cont-2-1'> 
    <?php
	
	$username = $USER->username;

//                          ......................               My posts 
$quer = "SELECT c.topic_replies, c.topic_views, b.username, a.post_id, a.forum_id, a.topic_id, a.post_text, a.post_subject, a.post_time from phpbb_posts a, phpbb_users b, phpbb_topics c WHERE a.topic_id=c.topic_id AND b.username='" . $username . "' AND b.user_id=a.poster_id ORDER BY post_time DESC";
$resourc=mysql_query($quer);
$post_id = array();
$forum_id = array();
$topic_id = array();
$post_sub = array();
$post_time = array();
$topic_views = array();
$topic_replies = array();
while ($row = mysql_fetch_array($resourc)) {
    $username = $row['username'];
    $post_id[] = $row['post_id'];
    $forum_id[] = $row['forum_id'];
    $topic_id[] = $row['topic_id'];
    $post_sub[] = $row['post_subject'];    
    $post_time[] = date('jS \of F Y',$row['post_time']);
    $topic_views[] = $row['topic_views'];
    $topic_replies[] = $row['topic_replies'];
}
echo "<H4>My Posts</H4>";
echo "<table width=100%>";
$my_post_n = min(4,count($post_id));
for($i=0; $i<$my_post_n; $i++) {
    $topic_url = "http://www.edupristine.com/discuss/topic" . $topic_id[$i] . ".html#p" . $post_id[$i];
    echo "<tr style='color:grey'><td width=70%> <a href=$topic_url> <h3> $post_sub[$i]</h3> </a> </td><td width=15%> <span class='Reply_No'> $topic_replies[$i] </span> Replies </td><td width=15%><span class='Views_No'> $topic_views[$i] </span> Views</td> </tr>";

	  echo "<tr> <td colspan='3'><table width='60%'><tr><td width=50% class='Post_Detail'> Posted on $post_time[$i] </td><td width='5%' class='Post_Detail'> by </td><td class='Post_Name'> $username </td></tr> </table></td></tr>";
}
echo "</table>";
	
	?>
  </div>
<!--<table width='100%'><tr><td width='93%'>My Forum </td><td style='font-size:11px;'> <a href=http://www.edupristine.com/discuss/> view all</a></td></tr></table>-->


<?php 

mysql_close($phpbblink);
}


?> 
            
        
