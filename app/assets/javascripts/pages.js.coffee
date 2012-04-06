# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("#search_form").submit ->
		# src = new EventSource($("#search_form").attr('action')+encodeURI($("#search_query").val()));
		# src.onmessage ->
		# 	$("#search_form").append("\n" + e.data)	
		$.ajax $("#search_form").attr('action')+encodeURI($("#search_query").val()),
			type: 'GET'
			dataType: 'jsonp'
			success: (data) ->
				$("#search_form").append "<p><strong>Amazon:</strong> #{data['Search::Amazon']}</p>"
				$("#search_form").append "<p><strong>Hulu:</strong> #{data['Search::Hulu']}</p>"
				$("#search_form").append "<p><strong>iTunes:</strong> #{data['Search::Itunes']}</p>"
				$("#search_form").append "<p><strong>Netflix:</strong> #{data['Search::Netflix']}</p>"
		false