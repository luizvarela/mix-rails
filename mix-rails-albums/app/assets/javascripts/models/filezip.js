var FileZip = Backbone.Model.extend({
    defaults: {
        progress: 0,
        loadedBytes: 0,
        totalBytes: 0,
        loadingMessage: 'Loading zip file ...'
    }
});