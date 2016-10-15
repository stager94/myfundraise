$ ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1.7777
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#campaign_crop_x').val(coords.x * @aspectRatio())
    $('#campaign_crop_y').val(coords.y * @aspectRatio())
    $('#campaign_crop_w').val(coords.w * @aspectRatio())
    $('#campaign_crop_h').val(coords.h * @aspectRatio())
    @updatePreview(coords)

  aspectRatio: ->
    originalWidth = $("#cropbox").data 'width'
    width = $("#cropbox").width()
    return originalWidth / width

  updatePreview: (coords) =>
  	$('#preview').css
  		width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
  		height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
  		marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
			marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
