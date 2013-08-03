App.SessionsNewController = Ember.ObjectController.extend({
  needs: ['currentUser'],

  save: function() {
    var self = this;

    this.content.save().then(function() {
      var userJSON = self.content.toJSON();
      userJSON.id = 'current';
      var object = self.store.load(App.User, userJSON);
      var user = App.User.find('current');

      self.get('controllers.currentUser').set('content', user);
      self.transitionToRoute('index');
    });
  },

  cancel: function() {
    this.content.deleteRecord();
    this.transitionToRoute('index');
  }
});
