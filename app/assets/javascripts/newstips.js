window.Newstips = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function($root) {
		Newstips.newsrouter = new Newstips.Routers.NewstipsRouter($root);
		Backbone.history.start();
  }
};
