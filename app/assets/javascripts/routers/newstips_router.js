Newstips.Routers.NewsTipsRouter = Backbone.Router.extend({
	routes: {
		"" : "tips",
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
	
	search: function () {
		
	}, 
	
	searchResults: function () {
		
	}
})