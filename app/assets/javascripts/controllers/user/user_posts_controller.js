App.UserPostsController = Ember.ArrayController.extend({
  needs: ['user', 'currentUser']
});
