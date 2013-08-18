App.User = DS.Model.extend({
  email: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  about: DS.attr('string'),
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  gender: DS.attr('string'),
  birthDate: DS.attr('string'),
  politicalViews: DS.attr('string'),
  religiousViews: DS.attr('string'),
  lookingFor: DS.attr('string'),
  interestedIn: DS.attr('string'),
  favoriteQuotes: DS.attr('string'),
  profilePictureUrlBig: DS.attr('string'),
  profilePictureUrlSmall: DS.attr('string'),
  coverPictureUrl: DS.attr('string'),
  friendRequestRecipients: DS.hasMany('App.User'),
  friendRequestSenders: DS.hasMany('App.User'),
  friends: DS.hasMany('App.User'),
  wallPosts: DS.hasMany('App.Post'),

  name: function () {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName'),

  // need this since linkTo doesn't work right
  urlHack: function () {
    return "#/users/" + this.get('id');
  }.property('id'),

  hasPendingFriendRequests: function () {
    return this.get('friendRequestSenders.length');
  }.property('friendRequestSenders.@each')
});
