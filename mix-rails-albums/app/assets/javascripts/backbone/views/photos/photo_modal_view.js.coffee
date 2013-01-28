Application.Views.Photos ||= {}

class Application.Views.Photos.PhotoModalEditView extends Backbone.View
  template: JST["backbone/templates/photos/photo_modal_edit"]
  tagName: "div"
  #className: "span2"
  events:
    "click .save": "save_changes"

  initialize: ->
    @model.on "change", @render, this

  render: ->
    data = _.defaults(@model.attributes,
      id: null
    )
    html = @template(@model.attributes)
    $(@el).html html
    this

  save_changes: (e) ->
    e.preventDefault()
    description = $("#input_photo_description_#{@model.id}").val()
    @model.set(description: description)
    $.post @model.url() + '/update_description', @model.attributes, (data) ->
      Backbone.history.navigate('photo_edited')