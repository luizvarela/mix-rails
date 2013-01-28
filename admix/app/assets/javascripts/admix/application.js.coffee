#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require jquery/jquery.livequery
#= require fancybox
#= require jquery.ui.all
#= require bootstrap
#= require ./dates
#= require ../../nicedit/nicEdit
#= require ./nicedit_applier
#= require ../../tipsy/src/javascripts/jquery.tipsy
# ./tipsy_init
#= require jquery.qtip.js


Backbone.emulateHTTP = true

$ ->

  $(".actions [title]").livequery ->
    $(this).qtip
      content: $(this).attr("title") # Use the tooltip attribute of the element for the content
      #style: "dark" # Give it a crea mstyle to make it stand out
      style:
        classes: 'qtip-bootstrap'
  
  $('.fancybox').livequery ->
    $(@).fancybox();