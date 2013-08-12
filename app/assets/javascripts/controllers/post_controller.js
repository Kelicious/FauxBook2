App.PostController = Ember.ObjectController.extend({
  createComment: function () {
    var that = this,
        body = this.get('newCommentBody');
    if (!body.trim()) return;

    this.set('newCommentBody', '');

    $.post('/posts/' + this.get('id') + '/comments', {
      comment: {
        body: body
      }
    }).done(function (data) {
      that.get('model').reload();
    });
  }
});
