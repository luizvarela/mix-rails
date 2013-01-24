#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require backbone_rails_sync
#= require backbone_datalink
#= require jquery/jquery.livequery
#= require fancybox
#= require jquery.ui.datepicker
#= require bootstrap
#= require ./dates
#= require ../../nicedit/nicEdit
#= require ./nicedit_applier
#= require ../../tipsy/src/javascripts/jquery.tipsy
#= require ./tipsy_init

$ ->
  
  $('.fancybox').livequery ->
    $(@).fancybox();