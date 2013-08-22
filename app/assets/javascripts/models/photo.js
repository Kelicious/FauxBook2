App.Photo = DS.Model.extend({
  description: DS.attr('string'),
  pictureUrlBig: DS.attr('string'),
  pictureUrlSmall: DS.attr('string'),
  album: DS.belongsTo('App.Album'),
  createdAt: DS.attr('date')
});
