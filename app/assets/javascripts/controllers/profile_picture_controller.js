App.ProfilePictureController = Ember.ObjectController.extend({
  uploadProfilePicture: function () {
    $('#profile-picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        console.log(response);
      },
      error: function (response) {
        console.log(response);
      }
    });
  },

  uploadCoverPicture: function () {
    $('#cover-picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        console.log(response);
      },
      error: function (response) {
        console.log(response);
      }
    });
  }
});
