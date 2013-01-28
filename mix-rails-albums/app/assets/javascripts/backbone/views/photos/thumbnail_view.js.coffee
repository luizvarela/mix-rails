Application.Views.Photos ||= {}

class Application.Views.Photos.PhotoView extends Backbone.View
  template: JST["backbone/templates/photos/thumbnail"]

  events:
    "click .destroy" : "destroy"
    "click .edit": "edit",
    "keydown textarea": 'update_description'
    "click .save": 'save_description'

  tagName: "li"
  className: 'span4'

  initialize: ->
    @tmpDescription = null
    @model.on "change", @render, this
    @model.on "uploadCompleted", @removeProgressBar, this
    self = @
    $(@el).find('a[tooltip]').livequery ->
      $(this).qtip
        content: $(this).attr("tooltip") # Use the tooltip attribute of the element for the content
        #style: "dark" # Give it a crea mstyle to make it stand out
        style:
          classes: "qtip-bootstrap qtip-#{self.model.get('id')}"

  removeProgressBar: ->
    @$el.find(".progress").fadeOut()  unless @$el is undefined

  destroy: ->
    if confirm('Tem certeza que deseja deletar?')
      @model.destroy()
      @$el.fadeOut 500, () =>
        @remove()
      $(".qtip-#{@model.get('id')}").remove()
    false
  edit: () ->
    Backbone.history.navigate("#/#{@model.id}/edit")
    false
  update_description: () ->
    self = @
    $(@el).find('textarea').livequery ->
      new_description = $(this).val()
      self.tmpDescription = new_description
      $(self.el).find('.save').show()

  save_description: (e) ->
    e.preventDefault()
    @doHighlighter = true
    new_description = $(@el).find('textarea').val()
    @model.set(description : new_description)
    @tmpDescription = null
    $.post @model.url() + '/update_description', @model.attributes, (data) =>
      $(@el).find('.save').hide()

  render: ->
    @$el.html(@template(@model))
    if @doHighlighter?
      @$el.find('textarea').effect('highlight', {}, 3000)
      @doHighlighter = undefined
    return this
