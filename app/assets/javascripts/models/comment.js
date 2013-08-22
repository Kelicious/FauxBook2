App.Comment = DS.Model.extend({
  author: DS.belongsTo('App.User'),
  body: DS.attr('string'),
  createdAt: DS.attr('date')
});
