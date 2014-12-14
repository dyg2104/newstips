Newstips.Collections.Tips = Backbone.Collection.extend({
	url: '/api/tips',
	
	model: Newstips.Models.Tip,
	
	parse: function(response) {
		return response.tips;
	}
});