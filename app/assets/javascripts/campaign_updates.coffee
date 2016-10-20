window.CampaignUpdates =
	openForm: ->
		$(".update-form").removeClass "hidden"
		$(".update-fake-form").addClass "hidden"

	hideForm: ->
		$(".update-form").addClass "hidden"
		$(".update-fake-form").removeClass "hidden"
