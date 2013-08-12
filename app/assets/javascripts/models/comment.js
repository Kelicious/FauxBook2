App.Comment = DS.Model.extend({
  post: DS.belongsTo('App.Post'),
  author: DS.belongsTo('App.User'),
  body: DS.attr('string'),
  createdAt: DS.attr('date')
});
