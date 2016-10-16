$ ->
	$('.navbar.navbar-fixed-top .dropdown').on 'show.bs.dropdown', ->
		$(".wrapper-overlay").removeClass "hidden"

	$('.navbar.navbar-fixed-top .dropdown').on 'hide.bs.dropdown', ->
		$(".wrapper-overlay").addClass "hidden"

