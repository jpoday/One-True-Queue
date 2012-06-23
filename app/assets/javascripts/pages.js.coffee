# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$curtainopen = true;
	
	$("#search_query").keyup (e) ->
		if e.keyCode == 13
			clearResults()
			curtain()
			search()
	
	$("#search_submit")
		.click(-> clearResults())
		.click(-> curtain())
		.click(-> search())
		
	clearResults = ->
		$("#best_guess").empty()
		$("#col1").empty()
		$("#col2").empty()
		$("#col3").empty()
		$("#col4").empty()
		
	curtain = ->
		if ($curtainopen == false)
			$(".leftcurtain").stop().animate({width:'5%'}, 2000 )
			$(".rightcurtain").stop().animate({width:'5%'},2000 )
			$curtainopen = true
		else
			$(".leftcurtain").stop().animate({width:'50%'}, 2000 )
			$(".rightcurtain").stop().animate({width:'51%'}, 2000 )
			$curtainopen = false
		return false;
		
	search = ->
		# src = new EventSource($("#search_form").attr('action')+encodeURI($("#search_query").val()));
		# src.onmessage ->
		# 	$("#search_form").append("\n" + e.data)
		$.ajax $("#search_form").attr('action')+encodeURI($("#search_query").val()),
			type: 'GET'
			dataType: 'jsonp'
			success: (data) ->
				render data
		false
		
	render = (data) ->
		$("#best_guess").append Mustache.to_html($('#best_guess_filler').html(), data['BestGuess'])
		curtain()
		$("#best_guess").fadeIn(2000)
		for result,i in data['Search::Amazon']
			if i<3
        n = i+1
      else
        n = "n"
			result.n = n
			$("#col1").append Mustache.to_html($('#amazon_template').html(), result)
			$(".result").fadeIn(2000)
		unless not data['Search::Hulu'].length
			for result,i in data['Search::Hulu']
				if i<3
	        n = i+1
	      else
	        n = "n"
				result.n = n
				$("#col2").append Mustache.to_html($('#hulu_template').html(), result)
				$(".result").fadeIn(2000)
		else
			$("#col2").append Mustache.to_html($('#empty_template').html(), {service: "Hulu"})
			$(".result").fadeIn(2000)
		for result,i in data['Search::Itunes']
			if i<3
				n = i+1
			else
				n = "n"
			result.n = n
			$("#col3").append Mustache.to_html($('#itunes_template').html(), result)
			$(".result").fadeIn(2000)
		unless data['Search::Netflix'].length == 0
			for result,i in data['Search::Netflix']
				if i<3
					n = i+1
				else
					n = "n"
				result.n = n
				$("#col4").append Mustache.to_html($('#netflix_template').html(), result)
				$(".result").fadeIn(2000)
		else
			$("#col4").append Mustache.to_html($('#empty_template').html(), {service: "Netflix"})
			$(".result").fadeIn(2000)