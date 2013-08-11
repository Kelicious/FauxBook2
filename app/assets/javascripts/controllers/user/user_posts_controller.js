App.UserPostsController = Ember.ArrayController.extend({
  needs: ['user', 'currentUser'],

  createPost: function () {
    var that = this,
        body = this.get('newPostBody');
    if (!body.trim()) return;

    this.set('newPostBody', '');

    $.post('/users/' + this.get('controllers.user.id') + '/posts', {
      post: {
        body: body
      }
    }).done(function (data) {
      that.get('controllers.user.model').reload();
    });
  }
});
