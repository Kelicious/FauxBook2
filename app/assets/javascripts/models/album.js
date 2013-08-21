App.Album = DS.Model.extend({
  title: DS.attr('string'),
  user: DS.belongsTo('App.User'),
  photos: DS.hasMany('App.Photo')
});
