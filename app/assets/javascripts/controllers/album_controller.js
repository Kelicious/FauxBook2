App.AlbumController = Ember.ObjectController.extend({
  needs: ['currentUser'],

  canEdit: function () {
    var currentUser = this.get('controllers.currentUser.model');
    return currentUser.id == this.get('user.id');
  },

  formAction: function () {
    return "/albums/" + this.get('id') + "/photos";
  }.property('model'),

  uploadPhoto: function () {
    var self = this;
    $('#photo-form').ajaxForm().ajaxSubmit({
      success: function () {
        self.get('model').reload();
      }
    });
  }
});
