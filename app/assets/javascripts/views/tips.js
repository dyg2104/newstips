Newstips.Views.Tips = Backbone.View.extend({
	template: JST['tips/multiple'],
	
	initialize: function () {
		this.listenTo(this.collection, 'add sync remove', this.render)
	},
	
	tagName: 'table',
	
	className: 'table table-striped',
	
	render: function () {
		var content = this.template();
		var subView;
		
		this.$el.html(content);
		
		var that = this;
		this.collection.each(function(tip) {
			subView = new Newstips.Views.Tip({ model: tip });
			// console.log(subView.render().$el);
			that.$el.append(subView.render().$el);
			// console.log(tip);
		});
		// _.each(this.collection, function(model) {
			// console.log(model);
		// });
		// this.collection.eac
		
		// var s = new Newstips.Views.Tip();
		// this.$el.append(s.render().$el);
		
		return this;	
	}
	 
});