Newstips.Routers.NewsTipsRouter = Backbone.Router.extend({
	routes: {
		"" : "tips",
		"tip" : "tip",
		"search" : "search",
		"search/:query" : "searchResults"
	},
	
	tips: function () {
		var tips = new Newstips.Collections.Tips();
		tips.fetch({
			success: function({
			})
		})
	},
	
	tip: function(tipModel) {
		
	},
	
	search: function () {
		
	}, 
	
	searchResults: function (query) {
		
	}
})