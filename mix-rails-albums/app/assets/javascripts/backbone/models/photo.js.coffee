class Application.Models.Photo extends Backbone.Model
  paramRoot: 'photo'
  idAttribute: '_id'
  defaults:
    image: null
    description: null
    progress: 0
  
  initialize: ->
    @on 'add', @onAdd, @

  onAdd: ->
    xhr = new XMLHttpRequest()
    xhr.open "POST", @url
    datas = new FormData()
    datas.append "image", @get("image")
    xhr.upload.addEventListener "progress", (e) =>
      if e.lengthComputable
        currentState = (e.loaded / e.total) * 100
        @set progress: currentState

    xhr.onreadystatechange = (e) =>
      if e.currentTarget.readyState is 4
        @set progress: 100
        @trigger "uploadCompleted"
        if xhr.responseText
          responseObject = JSON.parse(xhr.responseText)
          @set responseObject
        else
          console.log "Não foi possível enviar o arquivo"


    # Start send the file.
    xhr.send datas

class Application.Collections.PhotosCollection extends Backbone.Collection
  model: Application.Models.Photo
  url: '/photos'

