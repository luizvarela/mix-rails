photos_initCallback = (carousel) ->
  jQuery(".jcarousel-control a").bind "click", ->
    carousel.scroll jQuery.jcarousel.intval(jQuery(this).text())
    false

  jQuery(".jcarousel-scroll select").bind "change", ->
    carousel.options.scroll = jQuery.jcarousel.intval(@options[@selectedIndex].value)
    false

  jQuery(".s-next").bind "click", (e) ->
    e.preventDefault()
    carousel.next()
    false

  jQuery(".s-prev").bind "click", (e)->
    e.preventDefault()
    carousel.prev()
    false

  $("a.trigger").click (e)->
    e.preventDefault()
    index = jQuery(this).attr('href').replace('#', "")
    carousel.scroll jQuery.jcarousel.intval(index)


mycarousel_initCallback = (carousel) ->
  jQuery(".jcarousel-control a").bind "click", ->
    carousel.scroll jQuery.jcarousel.intval(jQuery(this).text())
    false

  jQuery(".jcarousel-scroll select").bind "change", ->
    carousel.options.scroll = jQuery.jcarousel.intval(@options[@selectedIndex].value)
    false

  jQuery(".next-thumbs").bind "click", (e) ->
    e.preventDefault()
    carousel.next()
    false

  jQuery(".prev-thumbs").bind "click", (e) ->
    e.preventDefault()
    carousel.prev()
    false

$ ->

  photos = $("#photos-carousel").jcarousel
    visible: 1
    scroll: 1
    initCallback: photos_initCallback
    # This tells jCarousel NOT to autobuild prev/next buttons
    buttonNextHTML: null
    buttonPrevHTML: null


  $(".mycarousel").jcarousel
    visible: 6
    initCallback: mycarousel_initCallback
    # This tells jCarousel NOT to autobuild prev/next buttons
    buttonNextHTML: null
    buttonPrevHTML: null

