moodle2.2
=========
Moodle repository for open sourcing Edupristine's moodle modules.
Check out our moodle at http://moodle.edupristine.com/demo.php

Module 1 - Linking lessons to master video lesson
-------------------------------------------------
This module can be used when the course is heavily video oriented. 
Usually the smallest lesson contains more than one resources eg - 
Lesson - *Ethics for Charted Financial Analysts* may have a video, 
a pdf handout, some external urls for enthusiastic student and 
maybe one small test. This module makes all related items showing up 
on the video page, so the student doesnt have to go back to course page
and search for relevant materials. All related items are shown and 
linked below the video page. 

Implementation Details : Video is implemented as a HTML page, embeded
using video.js HTML5 video plugin. Video page searches for resources 
that have exactly same name as the video, if something is found then it
is displayed below the video and made clickable. Right now it searches for
quizes, resources and urls. Other types of modules can also be added if
required. So far we havent found any problem or issues with this approach.
The approach will break down in case on course has two video lessons with
exactly same name, which should happen actually. 

Module 2 - Multiple course pages for different types of content
---------------------------------------------------------------
A course has many types of modules - video, pdfs, links, quizes etc etc
A standard moodle course page shows all kinds of resources at once. 
What this module does is, creates separate urls for course pages showing
only one kind of module. 

Module 3 - Course Catalog or Dashboard has user feedback
--------------------------------------------------------
some text here

multiple course pages, is working now. 
eg. a url for course is - http://localhost/moodle/course/view.php?id=2
use display=page or display=quiz for displaying only those types of resources. 

http://localhost/moodle/course/view.php?id=2&display=quiz

Files responsible are
1. A theme folder named - pristine
2. A library file named - lib/pristine.php
3. The course library files - course/lib.php

[[Pending]] - > Make this as a plugin

There is a test / dummy database also in this repository, for quick installation. Has 2
courses for demostration of multiple course pages

Course catalog with performance feedback is also working now
Files resoinsible
1. Theme folder - pristine
2. A library file - lib/pristine.php

[[Pending]] - Make this a plugin
[[Pending]] - Topics complete is not reflecting a correct number
