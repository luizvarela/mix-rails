//= require jquery
//= require jquery_ujs
//= require jquery/jquery.livequery
//= require fancybox
//= require jquery.ui.datepicker
//= require ../../bootstrap/js/bootstrap.min
//= require ./dates
//= require ./underscore-min
//= require ./backbone-min
//= require ../../nicedit/nicEdit
//= require ./nicedit_applier
//= require ../../tipsy/src/javascripts/jquery.tipsy
//= require ./tipsy_init

$ ->
  $('.fancybox').livequery ->
    $(@).fancybox();