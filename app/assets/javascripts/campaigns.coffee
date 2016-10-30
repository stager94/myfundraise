window.MediaSelector =
	showVideo: ->
		$(".select-container").addClass "hidden"
		$(".video-container").removeClass "hidden"
	showAllVariants: ->
		$(".select-container").removeClass "hidden"
		$(".video-container").addClass "hidden"

$ ->
	$("#campaign_picture").on "change", ->
		$(this).closest("form").submit()
		return

	window.selectCoverFromComputer = ->
		$("#campaign_picture").click()
		return

	$('#selectize-city').selectize
		valueField: 'id'
		labelField: 'name_with_country'
		searchField: 'name_with_country'
		create: false
		load: (query, callback) ->
			if !query.length
				return callback()
			$.ajax
				url: 'http://localhost:3000/api/v1/cities/search?q=' + encodeURIComponent(query)
				type: 'GET'
				error: ->
					callback()
					return
				success: (res) ->
					callback res
					return
			return

	bestPictures = new Bloodhound(
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('id')
		queryTokenizer: Bloodhound.tokenizers.whitespace
		remote:
			url: '/api/v1/cities/search?q=%QUERY'
			wildcard: '%QUERY')

	$('#typeahead-city').typeahead null,
		name: 'best-pictures'
		display: 'name_with_country'
		source: bestPictures


	$( "#select-city" ).select2
		placeholder: 
			name_with_country: "Выберите город из списка"
		ajax:
			url: '/api/v1/cities/search'
			dataType: 'json'
			delay: 250
			data: (params) ->
				{
					q: params.term
				}
			processResults: (data, params) ->
				params.page = params.page or 1
				{
					results: data
				}
			cache: false
		escapeMarkup: (markup) ->
			markup
		minimumInputLength: 1
		templateResult: (city) ->
			if city.loading
				return city.text
			markup = '<option value="' + city.id + '">' + city.name_with_country + '</option>'
			markup
		templateSelection: (city) ->
			city.name_with_country or city.name

	$("#campaign_category_id").select2()
