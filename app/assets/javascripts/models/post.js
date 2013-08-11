App.Post = DS.Model.extend({
  body: DS.attr('string'),
  user: DS.belongsTo('App.User'),
  author: DS.belongsTo('App.User')
});
