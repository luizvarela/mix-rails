Application.Views.Photos ||= {}

class Application.Views.Photos.PhotoView extends Backbone.View
  template: JST["backbone/templates/photos/thumbnail"]

  events:
    "click .destroy" : "destroy"
    "click .edit": "edit",

  tagName: "li"
  className: 'span4'

  initialize: ->
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
      this.remove()
      $(".qtip-#{@model.get('id')}").remove()
    false
  edit: () ->
    Backbone.history.navigate("#/#{@model.id}/edit")
    false
  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
