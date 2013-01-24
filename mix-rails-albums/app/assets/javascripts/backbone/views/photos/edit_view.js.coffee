Application.Views.Photos ||= {}

class Application.Views.Photos.EditView extends Backbone.View
  template: JST["backbone/templates/photos/edit"]

  events:
    "submit #edit-photo": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (photo) =>
        @model = photo
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
