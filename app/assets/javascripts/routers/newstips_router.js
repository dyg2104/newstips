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
		tips.fetch();
		var tipsShow = new Newstips.Views.Tips({ collection: tips });
		this.root.html(tipsShow.render().$el);
	},

	tip: function(tipModel) {

	},

	search: function () {
		var view = new Newstips.Views.SearchShow()
		this.root.html(view.render().$el)
	},

	searchResults: function (query) {
		var tips = new Newstips.Collections.Tips();

		$.get(
			"/api/tips?query=" + query
		).success(function(data){
			tips.add(data.tips);
		});
		var tipsShow = new Newstips.Views.Tips({ collection: tips });
		this.root.html(tipsShow.render().$el);


	}
})
