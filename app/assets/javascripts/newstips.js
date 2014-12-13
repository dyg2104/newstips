window.Newstips = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($root) {
		new Newstips.Routers.NewstipsRouter($root);
		Backbone.history.start();
  }
};
