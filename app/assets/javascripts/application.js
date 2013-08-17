// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.form
//= require ace
//= require ace-elements
//= require bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require faux_book
//= require_tree .

// for more details see: http://emberjs.com/guides/application/
App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

Ember.Application.initializer({
  name: 'currentUser',

  initialize: function(container) {
    var store = container.lookup('store:main'),
        attributes = $('meta[name="current-user"]').attr('content'),
        user;
    if (attributes) {
      object = store.load(App.User, JSON.parse(attributes));
      user = App.User.find(object.id);
    } else {
      user = App.User.find('current');
    }

    container.lookup('controller:currentUser').set('content', user);
    container.typeInjection('controller', 'currentUser', 'controller:currentUser');
  }
});
