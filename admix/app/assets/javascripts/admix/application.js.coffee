#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require jquery/jquery.livequery
#= require fancybox
#= require jquery.ui.datepicker
#= require bootstrap
#= require ./dates
#= require ../../nicedit/nicEdit
#= require ./nicedit_applier
#= require ../../tipsy/src/javascripts/jquery.tipsy
#= require ./tipsy_init


Backbone.emulateHTTP = true

$ ->
  
  $('.fancybox').livequery ->
    $(@).fancybox();