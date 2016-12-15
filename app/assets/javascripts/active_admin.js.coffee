#= require active_admin/base
#= require tinymce

$(document).ready ->
  tinyMCE.init
    mode: 'textareas'
    menubar: false
    statusbar: false
    plugins: ['uploadimage', 'textcolor']
    toolbar: "forecolor,fontsizeselect,|,bold,italic,|,uploadimage,|,alignleft,aligncenter,alignright,alignjustify,|,bullist,numlist"
  return
