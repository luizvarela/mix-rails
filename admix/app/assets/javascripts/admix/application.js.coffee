#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require jquery/jquery.livequery
#= require fancybox
#= require jquery.ui.all
#= require bootstrap
#= require ../../nicedit/nicEdit
#= require ./nicedit_applier
#= require ../../tipsy/src/javascripts/jquery.tipsy
# ./tipsy_init
#= require jquery.qtip.js
#= require jquery.globalmoney



Backbone.emulateHTTP = true

$ ->

  window.cfgCulture = 'pt-BR'
  $.preferCulture(cfgCulture)

  $(".actions [title]").livequery ->
    $(this).qtip
      content: $(this).attr("title") # Use the tooltip attribute of the element for the content
      #style: "dark" # Give it a crea mstyle to make it stand out
      style:
        classes: 'qtip-bootstrap'
  
  $('.fancybox').livequery ->
    $(@).fancybox();

  $('.currency').livequery ->
    $(@).maskMoney
      symbol: 'R$'
      decimal: ','
      precision: 2
      thousands: '.'
      showSymbol: true

  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "dd/mm/yy"
      altField: $(this).next()