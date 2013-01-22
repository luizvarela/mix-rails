function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[[i]];
};

var FileZipView = Backbone.View.extend({
    initialize: function() {
        this.model.on('change', this.render, this);
        this.model.on('uploadCompleted', this.removeProgressBar);
        this.model.on('uploadCompleted', this.activeButtons);
        this.model.on('uploadCompleted', updateFileList);  
    },
    activeButtons: function(){
        jQuery('#upload-buttons').fadeIn();
    },
    removeProgressBar: function(){
        with({model: this.model}){
            if(this.$el != undefined) {
                this.$el.find('.progress').fadeOut();
                this.$el.find('.progress').fadeOut(500, function(){
                    model.set({fadeOutProgress: true});
                });  
            }  
        }
        
    },
    render : function(){
        var html;

        html =  '<p>'+ this.model.get('loadingMessage') +'</p>';
        html += '<p>' + bytesToSize(this.model.get('loadedBytes'), 3)+ ' / <b>' + bytesToSize(this.model.get('totalBytes'), 3) + '</b>'+'</p>';
        html += '<div class="progress '+ (this.model.get('progress') < 100 ? 'progress-striped active' : '') +'">';
        if(!this.model.has('fadeOutProgress'))
            html += '   <div class="bar" style="width:'+this.model.get('progress')+'%"></div>';
        html += '</div>';

        this.$el.html(html);

    }
});