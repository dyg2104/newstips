Newstips.Views.Tip = Backbone.View.extend({
	template: JST['tips/single'],
	
	tagName: 'tr',
	
	render: function () {
		var content = this.template();
		this.$el.html(content);
		return this;	
	}
	 
});