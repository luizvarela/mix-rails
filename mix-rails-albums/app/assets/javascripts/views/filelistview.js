var FileListView    = Backbone.View.extend({
    tagName: 'ul', 
    className: 'thumbnails',
    render: function(){
        this.$el.html('');
        this.collection.forEach(this.addOne, this);
        //$('[id^=popover]').popover({trigger:'click'});
        return this;
    },
    addOne: function(fileItem){
        var fileView = new FileView({model: fileItem});
        this.$el.append(fileView.render().el);
    }

});