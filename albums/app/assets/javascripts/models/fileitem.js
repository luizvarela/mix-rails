var FileItem = Backbone.Model.extend({
    defaults: {
        progress:0
    },
    initialize: function(){
        this.on('add', this.onAdd, this);
    },
    onAdd: function(file) {
        var _self = this;
                
        var xhr = new XMLHttpRequest();
        xhr.open("POST", this.url);
        var datas = new FormData();
        datas.append('image', this.get('image'));

        xhr.upload.addEventListener("progress", function(e) {
            if(e.lengthComputable) {
                var currentState = (e.loaded / e.total) * 100;
                _self.set({progress: currentState});
            }
        });
        
        xhr.onreadystatechange = function(e) {
            if(e.currentTarget.readyState == 4) {
                _self.set({progress: 100});
                _self.trigger('uploadCompleted');
                if(xhr.responseText){
                    var responseObject = JSON.parse(xhr.responseText);
                    _self.set(responseObject);
                } else {
                    console.log("Não foi possível enviar o arquivo");
                }
                
            }
        };

        // Start send the file.
        xhr.send(datas);
    }
});