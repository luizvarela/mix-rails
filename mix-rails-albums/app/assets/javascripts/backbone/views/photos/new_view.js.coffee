Application.Views.Photos ||= {}

class Application.Views.Photos.NewView extends Backbone.View
  template: JST["backbone/templates/photos/new"]

  events:
    "submit #new-photo": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (photo) =>
        @model = photo
        window.location.hash = "/#{@model.id}"

      error: (photo, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
