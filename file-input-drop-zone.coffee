# A File Input Drop Zone is a container (div, li, tr...)
# that contains a file input
# You can add file to that input either by :
# * dropping it into the dropzone
# * using the text field
# If an img is inside the dropzone, or if you set a preview element finder,
# it will be updated with a preview of your image (if the file is an image)

$.fn.extend
  fileInputDropZone: (options) ->
    # Default settings
    settings =
      disablePreview: false   # Set to false if no preview image
      # Override callbacks to find preview img and input from dropZone
      selectImg:     ($dropZone) -> $dropZone.find 'img'
      selectInput:   ($dropZone) -> $dropZone.find ':file'

    # Merge default settings with options.
    settings = $.extend settings, options

    setPreview = ($img, content) ->
      if $img
        if $img[0].tagName == 'IMG'
          $img.prop('src', content)
        else
          $img.css
            'background-image': 'url('+content+')'
            'background-repeat': 'no-repeat'
    
    updatePreview = ($img, file) ->
      if !settings.disablePreview && $img 
        if file.type.match /image[\/\-\w]*/
          reader = new FileReader()
          reader.onload = (ev) ->
            setPreview($img, ev.target.result)
          reader.readAsDataURL(file)
        else
          setPreview($img, '')
    
    @each ->
      $dropZone = $(this)
      unless settings.disablePreview
        $img   = settings.selectImg($dropZone)
      $input = settings.selectInput($dropZone)
      
      # On drop, syncs the image and the input
      @ondrop = (e) ->
        if e.dataTransfer
          e.preventDefault()
          files = e.dataTransfer.files
          updatePreview($img, files[0])
          $input.prop('files', files)
          false
      
      # On input change, syncs the preview
      $input.change ->
        if (files = this.files)
          updatePreview($img, files[0])
        else
          setPreview($img, '')

$ ->
  $('.file-input-drop-zone').fileInputDropZone()