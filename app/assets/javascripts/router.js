// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('users', function () {
    this.route('new');
  });

  this.resource('user', {path: 'users/:user_id'}, function () {
    this.route('info');
    this.route('friends');
    this.route('pictures');
    this.route('timeline');
  });

  this.resource('sessions', function () {
    this.route('new');
    this.route('destroy');
  });
});

App.ApplicationRoute = Ember.Route.extend({
  
});

App.IndexRoute = Ember.Route.extend({
  
});

App.UsersRoute = Ember.Route.extend({
  model: function () {
    return App.User.find();
  }
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
      success: function (response) {}
    });

    this.transitionTo('index');
  }
});

App.UserRoute = Ember.Route.extend({
  model: function (params) {
    return App.User.find(params.user_id);
  }
});

App.UserFriendsRoute = Ember.Route.extend({
  model: function (params) {
    var user = this.modelFor('user');
    var friends = user.get('friends');
    return friends;
  }
});

App.UserTimelineRoute = Ember.Route.extend({
  model: function (params) {
    var user = this.modelFor('user');
    var posts = user.get('wallPosts');
    return posts;
  }
});
