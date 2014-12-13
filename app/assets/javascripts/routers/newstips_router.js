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
		var view = new Newstips.Views.SearchShow()
	},

	searchResults: function (query) {
		var tips = new Newstips.Collections.Tips();
		tips.fetch({
			success: function({
				var view = new Newstips.Views.IndexShow({
					// collection: Newstips.Collections.
				});
			})
		})
	}
})
