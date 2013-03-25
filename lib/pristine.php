<?php
//contains functions that are used to customize moodle
//this file shall act as main repository of all new functions that.
//are not there originally in moodle
/*/--------------------------------------------
autenticate_cci_user($userid, $cci)         -   18
autenticate_cci_user_old($username, $cci)   -   52
check_username($username)                   -   90              
check_enrollment($username, $course)        -   99
enroll_user($userid, $course, $modifier)    -   125
create_cci_user($username, $cci, $email)    -   154
create_user($userData)                      -   256
moodle_time($tim, $now)                     -   352
send_cci_welcome_mail($toEmail, $name)      -   380
get_section_video_length($cmids)            -   397
get_course_buy_mapping($courseid)           -   408
//-------------------------------------------*/
function autenticate_cci_user($userid, $cci){
    global $CFG, $DB;
    if(is_numeric($userid)) {
        //all stuff here
        $cciDB = $DB->get_record_sql("SELECT a.cci_id,a.username FROM mdl_cci_user a, mdl_user b WHERE a.username=b.username AND b.id=$userid");
        if(!empty($cciDB)) {
            $username = $cciDB->username;
            $cciDB = $cciDB->cci_id;
            if($cciDB==$cci) {
                if($user = get_complete_user_data('username', $username)) {
                    //A non deleted user exists
                    global $USER;
                    $USER = $user;
                    $status = complete_user_login($user);
                    add_to_log(0,'cci-user','login', 'noPassLogin.php', $username);
                    return True;
                } else {
                    add_to_log(0,'cci-user','login-error-couldnt get user data', 'noPassLogin.php', $username);
                    return False;
                }
            } else {
            add_to_log(0,'cci-user','login-error-couldnt match cci/user pair', 'noPassLogin.php', $username);
            return False;
            }
        } else {
        add_to_log(0,'cci-user','login-error-this is not cci user', 'noPassLogin.php', $username);
            return False;
        }
    } else {  //else of is_numeric if
        error_log('bad input in username, potential hack');
        die();
    }
}

function autenticate_cci_user_old($username, $cci){
    global $CFG, $DB;
    $username = filter_var($username, FILTER_SANITIZE_EMAIL);
    if($username) {
        $username = mysql_real_escape_string($username);
        error_log($username);
    } else {
        error_log('bad input in username, potential hack');
        die();
    }
    $cci = mysql_real_escape_string($cci);
    //ca club india's user will not be sending passwords, so a separate authentication mechanism has to be made,
    //later-> add cci id column and iscci to user table, match both username and cciid for complete authentication
    $cciDB = $DB->get_record_sql("SELECT cci_id FROM mdl_cci_user WHERE username='$username'");
    if(!empty($cciDB)) {
        $cciDB = $cciDB->cci_id;
        if($cciDB==$cci) {
            if($user = get_complete_user_data('username', $username)) {
                //A non deleted user exists
                global $USER;
                $USER = $user;
                $status = complete_user_login($user);
                add_to_log(0,'cci-user','login', 'noPassLogin.php', $username);
                return True;
            } else {
                add_to_log(0,'cci-user','login-error-couldnt get user data', 'noPassLogin.php', $username);
                return False;
            }
        } else {
        add_to_log(0,'cci-user','login-error-couldnt match cci/user pair', 'noPassLogin.php', $username);
        return False;
        }
    } else {
    add_to_log(0,'cci-user','login-error-this is not cci user', 'noPassLogin.php', $username);
        return False;
    }
}

function check_username($username) {
    global $DB;
    if($DB->record_exists('user', array('username'=>$username))) {
        return True;
    } else {
        return False;
    }
}

function check_enrollment($username, $course){
    global $DB;
    //echo "checking enrollment <br>";
    $sql = "SELECT count(*)
            FROM mdl_user_enrolments a,
            mdl_enrol b,
            mdl_user c

            WHERE c.username='$username'
            AND a.userid=c.id
            AND b.courseid=$course
            AND a.enrolid=b.id";
    $n = $DB->count_records_sql($sql);
    if($n==0) {
        //user not enrolled
        return False;
    } elseif($n==1) {
        //user already enrolled
        return True;
    } else {
        //, One does not simply walk into this codeblock. ie<Data sanity not maintained>
        add_to_log($course, 'ERROR: ceck-enrollment', 'Entered into mordor code block');
        return False;
    }
}

function enroll_user($userid, $course, $modifier) {
    global $DB;
    $enrolData = $DB->get_record('enrol', array('enrol'=>'manual', 'courseid'=>$course));
    $user_enrolment = new stdClass();
        $user_enrolment->enrolid = $enrolData->id;
        $user_enrolment->status = '0';
        $user_enrolment->userid = $userid;
        $user_enrolment->timestart = time();
        $user_enrolment->timeend =  '0';
        $user_enrolment->modifierid = $modifier;  
        //Modifierid in this table is userid who enrolled this user, usually this is 2 for admin, 999 is reserved for CA club india
        $user_enrolment->timecreated = time();
        $user_enrolment->timemodified = time();
    $insertId = $DB->insert_record('user_enrolments', $user_enrolment);
    //addto log
    $context = $DB->get_record('context', array('contextlevel'=>50, 'instanceid'=>$course));
    $role = new stdClass();
        $role->roleid = 5;
        $role->contextid = $context->id;
        $role->userid = $userid;
        $role->component = '';
        $role->itemid = 0;
        $role->timemodified = time();
        $role->modifierid = $modifier;
    $insertId2 = $DB->insert_record('role_assignments', $role);
    add_to_log($course, 'enrolling user', 'modifier-' . $modifier, 'pristine.lib');
    return array('user_enrolment'=>$insertId, 'role_assignment'=>$insertId2);
}

function create_cci_user($username, $cci, $email) {
    if(empty($cci)) {
        return False;
        error_log("No cci given to create_cci_user function");
    }
    global $DB;
    //check if this username exists, if yes then add 01 and so on
    $userFlag = 1;
    $newUsername = $username;
    while($userFlag) {
        //check user exists
        //if yes then append 01 to username, and flag=1
        //if no, then create user and flag = 0
        if(check_username($newUsername)) {
            $newUsername = $username . $userFlag;
            $userFlag = $userFlag + 1;
        } else {
            $userFlag = 0;
            // <----code block for sql queries to create user starts ---> 
            $userData = new stdClass();
                $userData->username = $newUsername;
                $userData->auth = 'manual';
                $userData->suspended = '0';
                $userData->firstname = $username;
                $userData->lastname = '-';
                $userData->email = $email;
                $userData->maildisplay = '2';
                $userData->mailformat = '1';
                $userData->maildigest = '0';
                $userData->autosubscribe = '1';
                $userData->trackforums = '0';
                $userData->htmleditor = '1';
                $userData->ajax = '0';
                $userData->screenreader = '0';
                $userData->city = 'CCI';
                $userData->country = 'IN';
                $userData->timezone = '99';
                $userData->lang = 'EN';
                $userData->imagealt = '';
                $userData->url = '';
                $userData->icq ='';
                $userData->skype ='';
                $userData->aim ='';
                $userData->yahoo ='';
                $userData->msn ='';
                $userData->idnumber ='';
                $userData->institution ='';
                $userData->department ='';
                $userData->phone1 ='';
                $userData->phone2 ='';
                $userData->address ='';
                $userData->timemodified =time();
                $userData->description = '';
                $userData->descriptionformat = '1';
                $userData->mnethostid = '1';
                $userData->confirmed = '1';
                $userData->timecreated = time();
                $userData->password = md5('defaultCCIpass');
            $insertid1 = $DB->insert_record('user', $userData);
            add_to_log(0, 'cci-user', 'creating user', '', $newUsername);
            $contextData = new stdClass();
                $contextData->contextlevel = '30';
                $contextData->instanceid = $insertid1;
                $contextData->depth = '2';
                $contextData->path = NULL;
            $insertid2 = $DB->insert_record('context', $contextData);
            $contextData = new stdClass();
                $contextData->path = '/1/' . $insertid2;
                $contextData->id = $insertid2;
            $DB->update_record('context', $contextData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'auth_forcepasswordchange';
                $prefData->value = '0';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            $flagData = new stdClass();
                $flagData->flagtype = 'userpreferenceschanged';
                $flagData->name = $insertid1;
                $flagData->value = '1';
                $flagData->expiry = time() + 5*3600;
                $flagData->timemodified = time();
            $insertid4 = $DB->insert_record('cache_flags', $flagData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'email_bounce_count';
                $prefData->value = '1';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'email_send_count';
                $prefData->value = '1';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            $cciData = new stdClass();
                $cciData->cci_id = $cci;
                $cciData->username = $newUsername;
            $insertid5 = $DB->insert_record('cci_user', $cciData);
            // <--sql queries end -->
        }
    }
    return array('name'=>$newUsername, 'id'=>$insertid1);
}
// A method to create a new user in moodle. Input userdata is standard class, chec
function create_user($userData) {
    global $DB;
    $explodedEmail = explode('@', $userData->email);
    //check if this username exists, if yes then add 01 and so on
    $userFlag = 1;
    $newUsername = $explodedEmail[0];
    while($userFlag) {
        //check user exists
        //if yes then append 01 to username, and flag=1
        //if no, then create user and flag = 0
        if(check_username($newUsername)) {
            $newUsername = $newUsername . $userFlag;
            $userFlag = $userFlag + 1;
        } else {
            $userFlag = 0;
            echo "Creating this-> $newUsername";
            $userData->city=(!isset($userData->city)) ? 'Bombay' : $userData->city ;
            $userData->firstname=(!isset($userData->firstname)) ? ucfirst($username) : ucfirst($userData->firstname) ;
            $userData->lastname=(!isset($userData->lastname)) ? " " : ucfirst($userData->lastname) ;
            $userData->country=(!isset($userData->country)) ? 'Singapore' : $userData->country ;
            $userData->password=(!isset($userData->password)) ? 'pristine' : $userData->password ;
            $userData->username = $newUsername;
            $userData->auth = 'manual'; //Do not change this thing
            $userData->suspended = '0';
            $userData->maildisplay = '2';
            $userData->mailformat = '1';
            $userData->maildigest = '0';
            $userData->autosubscribe = '1';
            $userData->trackforums = '0';
            $userData->htmleditor = '1';
            $userData->ajax = '0';
            $userData->screenreader = '0';
            $userData->timezone = '99';
            $userData->lang = 'EN';
            $userData->imagealt = '';
            $userData->url ='';
            $userData->icq ='';
            $userData->skype ='';
            $userData->aim ='';
            $userData->yahoo ='';
            $userData->msn ='';
            $userData->idnumber ='';
            $userData->institution ='';
            $userData->department ='';
            $userData->phone1 ='';
            $userData->phone2 ='';
            $userData->timemodified =time();
            $userData->description = '';
            $userData->descriptionformat = '1';
            $userData->mnethostid = '1';
            $userData->confirmed = '1';
            $userData->timecreated = time();
            $userData->address ='';
            $userData->country = 'IN';
            // <----code block for sql queries to create user starts ---> 
            $insertid1 = $DB->insert_record('user', $userData);
            add_to_log(0, 'cci-user', 'creating user', '', $newUsername);
            $contextData = new stdClass();
                $contextData->contextlevel = '30';
                $contextData->instanceid = $insertid1;
                $contextData->depth = '2';
                $contextData->path = NULL;
            $insertid2 = $DB->insert_record('context', $contextData);
            $contextData = new stdClass();
                $contextData->path = '/1/' . $insertid2;
                $contextData->id = $insertid2;
            $DB->update_record('context', $contextData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'auth_forcepasswordchange';
                $prefData->value = '0';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            $flagData = new stdClass();
                $flagData->flagtype = 'userpreferenceschanged';
                $flagData->name = $insertid1;
                $flagData->value = '1';
                $flagData->expiry = time() + 5*3600;
                $flagData->timemodified = time();
            $insertid4 = $DB->insert_record('cache_flags', $flagData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'email_bounce_count';
                $prefData->value = '1';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            $prefData = new stdClass();
                $prefData->userid = $insertid1;
                $prefData->name = 'email_send_count';
                $prefData->value = '1';
            $insertid3 = $DB->insert_record('user_preferences', $prefData);
            // <--sql queries end -->
        }
    }
    return array('username'=>$newUsername, 'id'=>$insertid1);
}


function moodle_time($tim, $now) {
    $delta_min =  intval(($now - $tim)/60);
    $delta_hrs = intval($delta_min/60);
    if($delta_min<11) {
        $v=$delta_min . " min ago";
        return $v;
    } elseif($delta_min<59) {
        return "A few minutes ago";
    } elseif($delta_hrs<24) {
        $v=$delta_hrs . " hrs ago";
        return $v;
    } elseif($delta_hrs<48) {
        return "One day ago";
    } elseif($delta_hrs<72) {
        return "Two days ago";
    } else {
        $datE = getdate($tim);
        $month = substr($datE['month'],0,3);
        $day = $datE['mday'];
        if($day<10) {
            $day = "0" . $day;
        }
        $year = $datE['year'];
        $format_date = $month . " " . $day . ", " . $year;
        return $format_date;
    }
}

function send_cci_welcome_mail($toEmail, $name) {
    $subject = 'Welcome to Edupristine ';
    $headers = 'From: support@edupristine.com' . "\r\n" .
               'Bcc: ankit@eneev.com' . "\r\n" .
               'Bcc: prasad@edupristine.com' . "\r\n" .
               'Reply-To: support@edupristine.com' . "\r\n" .
               'X-Mailer: PHP/' . phpversion();
    $message = 'Hi ' . $name . "! \nThank You for joining Edupristine's courses on CA Club India' website. " .
               "\n \nCA Club India will soon be sending you login details. Once you log into their website, you will see EduPristine's course materials - Videos, Notes and Quiz assignments. For any doubts related to course materials, you are welcome to hangout on our forums http://www.edupristine.com/discuss/viewforum.php \n \nThanks and Regards, \nTeam EduPristine";
    $mailSentStatus = mail($toEmail, $subject, $message, $headers);
    if($mailSentStatus){
        error_log("Mail to $name Sent");
    } else {
        error_log("Some error occured");
    }
}

function get_section_video_length($cmids) {
    global $DB;
    if(strlen($cmids)>0) { //adding exception for new sections which dont have anything in them
        $sql = "SELECT sum(videoLength) AS time FROM mdl_course_modules a, mdl_page b WHERE a.id IN (" . $cmids . ") AND a.module=13 AND b.id=a.instance";
        $tim = $DB->get_record_sql($sql);
        return round(($tim->time)/60, 1);
    } else {
        return 0;
    }
}

function get_course_buy_mapping($courseid) {
    global $DB;
    $n = $DB->count_records('coursebuy_mapping', array('courseid'=>$courseid));
    if($n>0) {
        $urlData = $DB->get_record('coursebuy_mapping', array('courseid'=>$courseid));
        return $urlData->buy_url . '?utm_source=homepage&utm_medium=banner&utm_term=demo&utm_campaign=demolms';
    } else {
        return 'http://www.edupristine.com/ca/courses/?     utm_source=homepage&utm_medium=banner&utm_term=demo&utm_campaign=demolms';
    }
}

?>

