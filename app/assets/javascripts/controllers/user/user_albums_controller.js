App.UserAlbumsController = Ember.ArrayController.extend({
  needs: ['user', 'currentUser'],

  createAlbum: function () {
    var that = this,
        title = this.get('newAlbumTitle');
    if (!title.trim()) return;

    this.set('newAlbumTitle', '');

    $.post('/albums', {
      album: {
        title: title
      }
    }).done(function (data) {
      that.get('controllers.currentUser.model').reload();
    });
  }
});
