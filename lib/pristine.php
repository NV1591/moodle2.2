<?php
//contains functions that are used to customize moodle
//this file shall act as main repository of all new functions that.
//are not there originally in moodle
/*/--------------------------------------------
//-------------------------------------------*/
function get_cm_visibility_pristine($url) {
    $show = 0;
    if(isset($_GET["display"])) {      
        if($_GET["display"]=='all') {
            $show = 1;                      
        } elseif(($_GET["display"] == 'quiz') and (strpos($url, 'quiz') != false)) {
            $show = 1;
        } elseif(($_GET["display"] == 'page') and (strpos($url, 'page') != false)) {
            $show = 1;
        } elseif(($_GET["display"] == 'page') and (strpos($url, 'page') != false)) {
            $show = 1;
        }
    } else {
        $show = 1;
    }
    return $show;
}

