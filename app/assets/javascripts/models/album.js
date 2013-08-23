App.Album = DS.Model.extend({
  title: DS.attr('string'),
  user: DS.belongsTo('App.User'),
  photos: DS.hasMany('App.Photo'),

  firstPhoto: function () {
    return this.get('photos.firstObject');
  }.property('photos', 'photos.firstObject'),

  pictureUrl: function () {
    var photo = this.get('firstPhoto');
    if (photo && photo.get('pictureUrlSmall')) {
      return photo.get('pictureUrlSmall');
    } else {
      return "/assets/missing.jpg";
    }
  }.property('firstPhoto.pictureUrlSmall')
});
