# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$curtainopen = true;
	
	$("#search_query").keyup (e) ->
		if e.keyCode == 13
			search()
	
	$("#search_submit")
		.click(-> search())
		
	search = ->
		if validate()
			clearResults()
			curtain()
			clearHome()
			request()
		else
			false
		
	validate = ->
		if $("input#search_query")[0].value == ""
			$("input#search_query")[0].placeholder = ""
			$(".control-group").addClass("error")
			$(".help-block").show()
			false
		else
			true
			
	clearResults = ->
		$("#top_result").empty()
		$("#col1").empty()
		$("#col2").empty()
		$("#col3").empty()
		$("#col4").empty()
		
	clearHome = ->
		$("#search_form").hide()
		$("#splash").hide()
		$("#search_form").css("marginTop", "0px")
		
	curtain = ->
		if ($curtainopen == false)
			$(".leftcurtain").stop().animate({width:'5%'}, 2000 )
			$(".rightcurtain").stop().animate({width:'5%'},2000 )
			$(".sign").stop().animate({left: "-20%"}, 1500 )
			$curtainopen = true
		else
			$(".leftcurtain").stop().animate({width:'50%'}, 2000 )
			$(".rightcurtain").stop().animate({width:'51%'}, 2000 )
			$(".sign").stop().animate({left: "51%"}, 2500, "swing" )
			$curtainopen = false
		false;
		
	request = ->
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
		$("#top_result").append Mustache.to_html($('#top_result_filler').html(), data['TopResult'])
		curtain()
		$("#search_form").fadeIn(2000)
		$("#top_result").fadeIn(2000)
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