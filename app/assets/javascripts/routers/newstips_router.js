Newstips.Routers.NewstipsRouter = Backbone.Router.extend({
	routes: {
		"" : "tips",
		"tip" : "tip",
		"search" : "search",
		"search/:query" : "searchResults"
	},
	
	initialize: function (root) {
		this.root = root;
	},
	
	tips: function () {
		var tips = new Newstips.Collections.Tips();
		var tipsShow = new Newstips.Views.Tips({ collection: tips });
		this.root.html(tipsShow.render().$el);
	},
	
	tip: function(tipModel) {
		
	},
	
	search: function () {
		
	}, 
	
	searchResults: function (query) {
		
	}
})