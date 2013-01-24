Application.Views.Photos ||= {}

class Application.Views.Photos.PhotoView extends Backbone.View
  template: JST["backbone/templates/photos/thumbnail"]

  events:
    "click .destroy" : "destroy"
    "click .photo-link": "photo_link",

  tagName: "li"
  className: 'span2'

  initialize: ->
    @model.on "change", @render, this
    @model.on "uploadCompleted", @removeProgressBar, this

  removeProgressBar: ->
    @$el.find(".progress").fadeOut()  unless @$el is undefined

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  photo_link: () ->

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
