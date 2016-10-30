$ ->
	$("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
		window.location = "/dashboard/campaigns/new"
	).bind("ajax:error", (event, xhr, settings, exceptions) ->
		error_messages = if xhr.responseJSON['error']
			"<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
		else if xhr.responseJSON['errors']
			$.map(xhr.responseJSON["errors"], (v, k) ->
				"<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
			).join ""
		else
			"<div class='alert alert-danger pull-left'>Unknown error</div>"
		$(this).find('.errors').html(error_messages)
	)
