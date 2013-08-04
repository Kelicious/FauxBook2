// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('users', function () {
    this.route('new');
  });

  this.resource('sessions', function () {
    this.route('new');
    this.route('destroy');
  });

  this.route('profile_picture');
});

App.ApplicationRoute = Ember.Route.extend({
  
});

App.IndexRoute = Ember.Route.extend({
  
});

App.UsersNewRoute = Ember.Route.extend({
  model: function() {
    var user = App.User.createRecord();
    return user;
  },

  setupController: function(controller, model) {
    controller.set('content', model);
  }
});

App.SessionsNewRoute = Ember.Route.extend({
  model: function() {
    return App.Session.createRecord();
  },

  setupController: function(controller, model) {
    controller.set('content', model);
  }
});

App.SessionsDestroyRoute = Ember.Route.extend({
  enter: function() {
    var controller = this.controllerFor('currentUser');
    controller.set('content', undefined);

    $.ajax({
      type: 'DELETE',
      url: '/sessions/current',
      success: function (response) {

      }
    });

    this.transitionTo('index');
  }
});

App.ProfilePictureRoute = Ember.Route.extend({
  
});