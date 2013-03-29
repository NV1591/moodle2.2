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

Files Responsible - theme/pristine/layout/topics.php, lib/pristine.php

Module 2 - Multiple course pages for different types of content
---------------------------------------------------------------
A course has many types of modules - video, pdfs, links, quizes etc etc
A standard moodle course page shows all kinds of resources at once. 
What this module does is, creates separate urls for course pages showing
only one kind of module. 
1. To view all kinds of modules - moodle.domain.com/course/view.php?id=4
   or moodle.domain.com/course/view.php?id=4&display=all

2. To view only videos (implemented as pages)
   moodle.domain.com/course/view.php?id=4&display=page

3. To view only quizes
   moodle.domain.com/course/view.php?id=4&display=quiz

4. To view only urls
   moodle.domain.com/course/view.php?id=4&display=url

This can be extended for other kinds of modules also

Files Responsible - lib/pristine.php, course/lib.php

Module 3 - Course Catalog or Dashboard has user feedback
--------------------------------------------------------
Course catalog shows each course's user performance data.

1. Percentage course completed

2. Number of topics completed

3. Number of videos viewed

4. Number of Quizes attempted

5. Gross score in that course

Files Responsible - theme/pristine/layout/courses.php, theme/pristine/layout/dashboard.php, lib/pristine.php

Pending Tasks
-------------
This moodle implementation is far from perfect and far from what I desire,
listing down pending tasks. I encourage the moodle community to use this 
implementaion and improve it. 

* Convert three features into plugins

* Insert CSS and give some structure to looks

* Create a demo installation.

* Topics complete is not reflecting a correct number

Installation Guidelines
-----------------------

