App.AlbumController = Ember.ObjectController.extend({
  needs: ['currentUser'],

  canEdit: function () {
    var currentUser = this.get('controllers.currentUser.model');
    return currentUser.get('id') == this.get('user.id');
  }.property('user'),

  formAction: function () {
    return "/albums/" + this.get('id') + "/photos";
  }.property('model'),

  hasNoPhotos: function () {
    return this.get('photos.length') == 0;
  }.property('photos', 'photos.@each'),

  uploadPhoto: function () {
    var self = this,
        $form = $('#photo-form');
    $form.ajaxForm().ajaxSubmit({
      success: function () {
        self.get('model').reload();
        $form[0].reset();
      }
    });
  }
});
