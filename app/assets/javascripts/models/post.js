App.Post = DS.Model.extend({
  body: DS.attr('string'),
  user: DS.belongsTo('App.User'),
  author: DS.belongsTo('App.User'),
  createdAt: DS.attr('date'),

  isStatus: function () {
    // change later after figuring out how to get current user id to update
    return user.get('email') == author.get('email');
  }
});
