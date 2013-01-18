$ ->
  if $('.niceditor').length > 0
    niceditor = new nicEditor
      buttonList: ['fontSize', 'fontFormat', 'bold', 'italic', 'ol', 'ul', 'left', 'justify', 'center', 'right',
                  'image', 'upload', 'link', 'unlink', 'outdent', 'indent', 'hr']
      maxHeight: 400
      uploadURI: HOST_NAME + '/admix/upload'

    bkLib.onDomLoaded () ->
      $('.niceditor').each (index, element) ->
        $(element).wrap('<div class="niceditor-wrapper"></div>')
        nicEditors.editors.push( niceditor.panelInstance(element) )
