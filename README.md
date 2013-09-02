FauxBook Version 2
======
This is a second version of the FaceBook clone I built before.
The server side has been reduced to a REST API using Rails.
The client side uses ember.js and interacts with the server
by using ember-data some of the time, and AJAX for when ember-data
doesn't work.

Technologies Used
======
* Ruby
* Rails
* Devise
* Paperclip
* ActiveModel Serializers
* JavaScript
* jQuery
* Ember.js RC6
* Ember-Data
* Handlebars.js

This app uses Amazon Web Services for hosting uploaded pictures.
To get it to work, you can either set up your own bucket or
remove the AWS configuration from config/development.rb.

To Do
=====
* Block timeline from non-friends
* Update ember to 1.0 release
* Add likes
* Add progress bar to picture uploads
* Prevent user from commenting too quickly (unless new version of ember-data fixes the issue)
