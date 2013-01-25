class Application.Routers.PhotosRouter extends Backbone.Router
  initialize: (options) ->
    @photos = new Application.Collections.PhotosCollection()
    @photos.url = options.collectionUrl
    @photos.reset options.photos

  routes:
    "new"      : "newPhoto"
    "index"    : "index"
    "upload_index" : "upload_index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "upload_index"

  newPhoto: ->
    @view = new Application.Views.Photos.NewView(collection: @photos)
    $("#upload-container").html(@view.render().el)

  index: ->
    @view = new Application.Views.Photos.IndexView(photos: @photos)
    $("#upload-container").html(@view.render().el)

  upload_index: ->
    @view = new Application.Views.Photos.UploadIndexView(photos: @photos)
    $("#upload-container").html(@view.render().el)

  show: (id) ->
    photo = @photos.get(id)

    @view = new Application.Views.Photos.ShowView(model: photo)
    $("#upload-container").html(@view.render().el)

  edit: (id) ->
    photo = @photos.get(id)
    console.log 'Editando a foto!' + photo
    #@view = new Application.Views.Photos.EditView(model: photo)
    #$("#upload-container").html(@view.render().el)
