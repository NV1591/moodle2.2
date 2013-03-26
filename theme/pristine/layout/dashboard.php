<?php
global $DB;
$sql = "SELECT a.courseid,
                c.fullname
        FROM mdl_enrol a,
             mdl_user_enrolments b,
             mdl_course c
        WHERE a.id=b.enrolid
              AND a.status=b.status
              AND b.userid=?
              AND c.id=a.courseid";
$courses_list = $DB->get_records_sql($sql, array($USER->id));
?>
<link rel="stylesheet" href="../css/styles.css" media="all" />
<div>
<h2>My Courses (<?php echo count($courses_list); ?>)</h2>
&#160;
<?php print_dashboard($courses_list, $USER->id); ?>
</div>
</div>
