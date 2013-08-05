App.ProfilePictureController = Ember.ObjectController.extend({
  needs: ['currentUser'],

  uploadProfilePicture: function () {
    var self = this;

    $('#profile-picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        self.get('controllers.currentUser.content')
          .setProperties('profilePictureUrl', response.user.profile_picture_url);
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
        self.get('controllers.currentUser.content')
          .set('coverPictureUrl', response.user.cover_picture_url);
      },
      error: function (response) {
        console.log(response);
      }
    });
  }
});
