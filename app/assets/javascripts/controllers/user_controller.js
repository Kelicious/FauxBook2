App.UserController = Ember.ObjectController.extend({
  needs: 'currentUser',
  isEditingPictures: false,
  isEditingInfo: false,

  // Hack needed because linkTo doesn't upate its href on model change
  timelinePath: function () {
    return "#/users/" + this.get('id') + "/timeline";
  }.property('id'),

  infoPath: function () {
    return "#/users/" + this.get('id') + "/info";
  }.property('id'),

  friendsPath: function () {
    return "#/users/" + this.get('id') + "/friends";
  }.property('id'),

  isCurrentUser: function () {
    return this.get('email') == this.get('controllers.currentUser.email');
  }.property('controllers.currentUser', 'model'),

  switchUserCallback: function () {
    this.set('isEditingInfo', false);
    this.set('isEditingPictures', false);
  }.observes('model', 'controllers.currentUser'),

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
  },

  numFriends: function () {
    return this.get('model.friends.length');
  }.property('model.friends.@each'),

  isFriend: function () {
    var friends = this.get('controllers.currentUser.model.friends')
          .filterProperty('id', this.get('id'));

    return friends.get('length') > 0;
  }.property('model', 'controllers.currentUser.model.friends.@each'),

  isFriendRequestSender: function () {
    var senders = this
          .get('controllers.currentUser.model.friendRequestSenders')
          .filterProperty('id', this.get('id'));

    return senders.get('length') > 0;
  }.property('model', 'controllers.currentUser.model.friendRequestSenders.@each'),

  isFriendRequestRecipient: function () {
    var recipients = this
          .get('controllers.currentUser.model.friendRequestRecipients')
          .filterProperty('id', this.get('id'));

    return recipients.get('length') > 0;
  }.property('model', 'controllers.currentUser.model.friendRequestRecipients.@each'),

  addFriend: function () {
    var that = this;

    $.post('/users/' + this.get('id') + '/friend_request')
      .done(function (response) {
        that.get('model').reload();
        that.get('controllers.currentUser.model').reload();
      }).fail(function () {
        console.log("addFriend failed");
      });
  },

  cancelFriendRequest: function () {
    var that = this;

    $.post('/users/' + this.get('id') + '/cancel_request')
      .done(function (response) {
        that.get('model').reload();
        that.get('controllers.currentUser.model').reload();
      }).fail(function () {
        console.log("addFriend failed");
      });
  },

  acceptFriendRequest: function () {
    var that = this;

    $.post('/users/' + this.get('id') + '/accept_request')
      .done(function (response) {
        that.get('model').reload();
        that.get('controllers.currentUser.model').reload();
      }).fail(function () {
        console.log("acceptFriendRequest failed");
      });
  },

  rejectFriendRequest: function () {
    var that = this;

    $.post('/users/' + this.get('id') + '/reject_request')
      .done(function (response) {
        that.get('model').reload();
        that.get('controllers.currentUser.model').reload();
      }).fail(function () {
        console.log("acceptFriendRequest failed");
      });
  },

  removeFriend: function () {
    var that = this;

    $.post('/users/' + this.get('id') + '/unfriend')
      .done(function (response) {
        that.get('model').reload();
        that.get('controllers.currentUser.model').reload();
      }).fail(function () {
        console.log("removeFriend failed");
      });
  }
});
