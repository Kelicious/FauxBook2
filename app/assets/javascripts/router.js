// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('users', function () {
    this.route('new');
  });

  this.resource('user', {path: 'users/:user_id'}, function () {
    this.route('info');
    this.route('friends');
    this.route('pictures');
    this.route('posts', {path: 'timeline'});
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

App.AuthenticatedRoute = Ember.Route.extend({
  beforeModel: function (transition) {

    if (!this.controllerFor('currentUser').get('content.email')) {
      this.redirectToLogin(transition);
    }
  },

  redirectToLogin: function (transition) {
    alert("You must log in!");

    var sessionsNewController = this.controllerFor('sessionsNew');
    this.transitionTo('sessions.new');
  }
});

App.UsersRoute = App.AuthenticatedRoute.extend({
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

    console.log("HELLO");

    $.ajax({
      type: 'DELETE',
      url: '/sessions/current',
      success: function (response) {}
    });

    this.transitionTo('index');
    console.log("HELLO");
  }
});

App.UserRoute = App.AuthenticatedRoute.extend({
  model: function (params) {
    return App.User.find(params.user_id);
  }
});

App.UserFriendsRoute = App.AuthenticatedRoute.extend({
  model: function (params) {
    var user = this.modelFor('user');
    var friends = user.get('friends');
    return friends;
  }
});

App.UserPostsRoute = App.AuthenticatedRoute.extend({
  model: function (params) {
    var user = this.modelFor('user');
    var posts = user.get('wallPosts');
    return posts;
  }
});
