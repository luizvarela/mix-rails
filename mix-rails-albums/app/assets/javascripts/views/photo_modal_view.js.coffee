class window.PhotoModalView extends Backbone.View
  tagName: "div"
  #className: "span2"
  events:
    "click .save": "save_changes"

  initialize: ->
    @template = JST["photo_modal_edit"]
    @model.on "change", @render, this

  render: ->
    data = _.defaults(@model.attributes,
      progress: null
      id: null
      title: null
    )
    html = @template(@model.attributes)
    $(@el).html html
    this

  save_changes: (e) ->
    e.preventDefault()
    description = $("#input_photo_description_#{@model.get('id')}").val()
    @model.set(description: description)
    @model.save()