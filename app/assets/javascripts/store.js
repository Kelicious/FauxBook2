// http://emberjs.com/guides/models/defining-a-store/

DS.RESTAdapter.map('App.Post', {
  comments: { embedded: 'always' }
});

App.Store = DS.Store.extend({
  revision: 12,
  adapter: DS.RESTAdapter.create()
});

