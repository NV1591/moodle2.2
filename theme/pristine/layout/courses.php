<?php
// start doctype etc head elements
if(!empty($_COOKIE['MoodleSession'])) {
    $fname = ucfirst($USER->firstname);
    $lname = ucfirst($USER->lastname);
    setcookie('mdl_firstname',$fname,time()+10800,'/','.edupristine.com');
    setcookie('mdl_lastname',$lname,time()+10800,'/','.edupristine.com');
}

$hassidepre = $PAGE->blocks->region_has_content('side-pre', $OUTPUT);
$hassidepost = $PAGE->blocks->region_has_content('side-post', $OUTPUT);
if($USER->id==2) {
    $checkadmin=1;
} else {
    $checkadmin=0;
}
echo $OUTPUT->doctype(); ?>
<html <?php echo $OUTPUT->htmlattributes() ?>>
<head>
    <title><?php echo $PAGE->title ?></title>
    <?php echo $OUTPUT->standard_head_html() ?>
</head>

<body id="<?php p($PAGE->bodyid); ?>" class="<?php p($PAGE->bodyclasses); ?>">
<?php echo $OUTPUT->standard_top_of_body_html() ?>


</style>
<link rel="stylesheet" type="text/css" href="http://www.edupristine.com/wp-content/themes/default/css/reset.css" />
<link rel="stylesheet" type="text/css" href="http://www.edupristine.com/wp-content/themes/default/css/style.min.css" />
   <link href="http://moodle.edupristine.com/theme/excitement/layout/css/c_list.css" rel="stylesheet" type="text/css" />

<!--<link rel="stylesheet" type="text/css" href="http://www.edupristine.com/wp-content/themes/default/css/pristine.css" />-->
 <?php
// start of pristine header
include('header.php');
?>

<div style="width:960px; margin-right:auto; margin-left:auto;">
<!--<div class="container">    
  <div class="alert walert alert-info">    
    <button type="button" class="close" data-dismiss="alert">&times;</button>         
    <strong>New Feature Alert!</strong> Now dont waste time looking out for lessons. We have added a search bar in courses.
    <u><strong><a style="color:#3a87ad" href=""></a></strong></u>
  </div>                                                                  
</div> --> 
<div class="breadcrumb wrap_head clearfix" style="min-width:400px !important; width:630px;" >
	
	 <?php echo $OUTPUT->navbar(); ?>
</div>
                    <div class="headermenu"><?php
              //  echo $OUTPUT->login_info();
                if (!empty($PAGE->layout_options['langmenu'])) {
                    echo $OUTPUT->lang_menu();
                }
                echo $PAGE->headingmenu
            ?></div>
		<div class="navbutton">
                   <?php if($checkadmin==1) {
                             echo $PAGE->button;
                         } ?></div> </div>
    </div>
	</div>
	</div>
</div>
<?php
// end of pristine header
?>
<div class="container">
<?php
// header ends here
?>
    <div id="region-main-box">
        <div id="region-post-box">
            <?php if (($hassidepre) and ($checkadmin)) { ?>
                <div id="region-pre">
                    <div class="region-content" >
                        <?php echo $OUTPUT->blocks_for_region('side-pre') ?>
                    </div>
                </div>
                <?php } else {
echo "  <div id='region-pre'>    <div class='region-content' style='border-bottom: 1px solid #E1E1E1;'>   ";
include('mynav.php');
echo "</div></div></div>";
}
 ?>
            <div id="region-main-wrap">
                <div id="region-main">
                    <div class="region-content" >
                       <!-- <?php echo core_renderer::MAIN_CONTENT_TOKEN ?> -->
                        <?php include('c_list.php'); ?>
                    </div>
                </div>
            </div>
                <?php if (($hassidepost) and ($checkadmin)) { ?>
                <div id="region-post">
                    <div class="region-content" >
                        <?php echo $OUTPUT->blocks_for_region('side-post') ?>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
</div>
            <?php
// start of footer
include('footer.php');
?>
<?php //echo $OUTPUT->standard_end_of_body_html() ?>
</body>
</html>
