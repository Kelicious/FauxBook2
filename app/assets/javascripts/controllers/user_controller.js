App.UserController = Ember.ObjectController.extend({
  needs: 'currentUser',
  isEditingPictures: false,
  isEditingInfo: false,

  isCurrentUser: function () {
    return this.get('email') == this.get('controllers.currentUser.email');
  }.property('controllers.currentUser.email', 'email'),

  editPictures: function () {
    this.set('isEditingPictures', true);
  },

  doneEditingPictures: function () {
    this.set('isEditingPictures', false);
  },

  editInfo: function () {
    this.set('isEditingInfo', true);
  },

  doneEditingInfo: function () {
    this.set('isEditingInfo', false);
    this.get('model').save();
  },

  uploadProfilePicture: function () {
    var self = this;
    $('#profile-picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        self.get('model')
          .set('profilePictureUrl', response.user.profile_picture_url);
      },
      error: function (response) {
        console.log(response);
      }
    });
  },

  uploadCoverPicture: function () {
    var self = this;
    $('#cover-picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        self.get('model')
          .set('coverPictureUrl', response.user.cover_picture_url);
      },
      error: function (response) {
        console.log(response);
      }
    });
  }
});
