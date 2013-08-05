App.ProfilePictureController = Ember.ObjectController.extend({
  uploadPicture: function () {
    console.log("hello");
    $('#picture-form').ajaxForm().ajaxSubmit({
      success: function (response) {
        console.log(response);
      },
      error: function (response) {
        console.log(response);
      }
    });
  }
});
