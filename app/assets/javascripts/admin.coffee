$(()->

	$(".datepicker").each(()->
		d = $(this).datepicker()
		d.datepicker('setDate', new Date($(this).val()))
	)
	
	$('a').each(()->
		_isSameUrl = location.href.match(new RegExp(this.href, 'gi'))
		$(this).addClass("current") if _isSameUrl
	)
	
)