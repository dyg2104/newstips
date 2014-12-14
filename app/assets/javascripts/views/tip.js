Newstips.Views.Tip = Backbone.View.extend({
	template: JST['tips/single'],
	
	initialize: function () {
		this.listenTo(this.model, 'add sync remove', this.render);
	},
	
	tagName: 'tr',
	
	render: function () {
		console.log(this.model);
		var content = this.template({ tip: this.model });
		this.$el.html(content);
		return this;	
	}
	 
});