window.CurrencySelector = 
	toggle: ->
		$(".currency-selector").toggleClass "opened"

	hide: ->
		$(".currency-selector").removeClass "opened"

	select: (currency) ->
		console.log currency
		CurrencySelector.hide()	
		$(".currency-selector > span").html currency.sign
		$("#campaign_currency_id").val currency.id
