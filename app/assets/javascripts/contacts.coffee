$(document).on 'turbolinks:load', ->
	jQuery ->
	$('#contact_location').parent().hide()
	locations = $('#contact_location').html()
	$('#contact_singup').change ->
		state = $('#contact_singup :selected').text()
		options = $(locations).filter("optgroup[label='#{state}']").html()
		if options
			$('#contact_location').html(options)
			$('#contact_location').parent().show()
		else
			$('#contact_location').empty()
			$('#contact_location').parent().hide()
