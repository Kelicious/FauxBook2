App.UserInfoController = Ember.ObjectController.extend({
  needs: 'user',

  editInfo: function () {
    this.get('controllers.user').editInfo();
  },

  doneEditingInfo: function () {
    this.get('controllers.user').doneEditingInfo();
  }
});
