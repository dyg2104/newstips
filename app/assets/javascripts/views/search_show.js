Newstips.Views.SearchShow = Backbone.View.extend({
  template: JST['search/show'],

  initialize: function(options){

  },

  events: {
    'submit':'search'
  },

  search: function(event){
    event.preventDefault();
    var that = this;
    console.log($(event.currentTarget))
    var search_field = $(event.currentTarget);
    // api/tips
    window.location = "/search/" + event;
  },

  render: function(){
    var content = this.template()

    this.$el.html(content);
    return this;
  }
})
