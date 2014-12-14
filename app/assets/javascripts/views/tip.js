Newstips.Views.Tip = Backbone.View.extend({
	template: JST['tips/single'],
	
	initialize: function () {
		this.listenTo(this.model, 'change sync remove', this.render);
	},
	
	tagName: 'div',

  className: 'tip-wrapper',

	render: function () {
		var city = encodeURIComponent(this.model.get('city'));
		var subject = encodeURIComponent(this.model.get('subject'));
		var that = this;
		
		$.get(
			"/api/related_articles?city=" + city + "&subject=" + subject
		).success(function(data){			
			that.model.set("story", data.related_articles[0]);
		});
			
		var content = this.template({ tip: this.model });
		this.$el.html(content);
		return this;	
	}
	 
});