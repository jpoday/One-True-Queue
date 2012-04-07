# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("#search_submit")
		.click(-> clearResults())
		.click(->
			# src = new EventSource($("#search_form").attr('action')+encodeURI($("#search_query").val()));
			# src.onmessage ->
			# 	$("#search_form").append("\n" + e.data)
			$.ajax $("#search_form").attr('action')+encodeURI($("#search_query").val()),
				type: 'GET'
				dataType: 'jsonp'
				success: (data) ->
					$("#amazon").append "<p>#{data['Search::Amazon']}</p>"
					$("#hulu").append "<p>#{data['Search::Hulu']}</p>"
					$("#itunes").append "<p>#{data['Search::Itunes']}</p>"
					$("#netflix").append "<p>#{data['Search::Netflix']}</p>"
			false
		)
		
	clearResults = ->
		$("#amazon").empty()
		$("#hulu").empty()
		$("#itunes").empty()
		$("#netflix").empty()