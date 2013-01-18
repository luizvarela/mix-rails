var FileView = Backbone.View.extend({
    tagName: 'li',
    className: 'span2',
    events: {
        "click .delete": "delete"
    },
    initialize: function(){
        this.template = JST['photo_view']
        this.model.on('change', this.render, this);
        this.model.on('uploadCompleted', this.removeProgressBar, this);
    },
    removeProgressBar: function(){
        if(this.$el != undefined)
            this.$el.find('.progress').fadeOut();
    },
    render : function(){
        var data = _.defaults(this.model.attributes, {progress: null, id: null, title: null})
        var html = this.template(this.model.attributes);
        $(this.el).html(html);
        return this;
    },
    delete: function(e) {
        e.preventDefault();
        this.model.destroy({
          success: function(model, response){
            console.log("Success");
          },
          error: function(model, response){
            console.log("Error");
          }
        });
        this.$el.fadeOut();
    }
});