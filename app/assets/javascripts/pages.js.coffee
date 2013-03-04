# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$curtainopen = true;
	
	window.onload = (e) ->
		if (!history.state || !history.state.data) 
			return
		else
			clearHome()
			render(history.state.data,true)
	
	$("#search_form").submit(-> search())
	
	$("#search_submit")
		.click(-> search())
		false
		
	search = ->
		if validate()
			clearResults()
			curtain()
			clearHome()
			request()
			curtain()
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
		$("#mixed_results").empty()
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
		$.ajax $("#search_form").attr('action')+encodeURI("?search_query="+$("#search_query").val()),
			type: 'GET'
			dataType: 'jsonp'
			timeout: 10000
			success: (data) ->
				history.replaceState({data: data}, null, window.location.href.split('#')[0]+'#'+$("#search_query").val())
				render(data,false)
			error: (x, t, m) ->
				displayError()
		false
		
	render = (data, reload) ->
		if data['TopResult']
			$("#top_result").append Mustache.to_html($('#top_result_template').html(), data['TopResult'])
		
		if data['MixedResults']
			$("#mixed_results").append Mustache.to_html($('#mixed_results_template').html(), data['MixedResults'])
		
		for result,i in data['Amazon']
			if i<3
        n = i+1
      else
        n = "n"
			result.n = n
			result.service = "Amazon"
			$("#col1").append Mustache.to_html($('#result_template').html(), result)
		
		if data['Hulu'].length
			for result,i in data['Hulu']
				if i<3
	        n = i+1
	      else
	        n = "n"
				result.n = n
				result.service = "Hulu"
				$("#col2").append Mustache.to_html($('#result_template').html(), result)
		else
			$("#col2").append Mustache.to_html($('#empty_template').html(), {service: "Hulu"})
		
		for result,i in data['Itunes']
			if i<3
				n = i+1
			else
				n = "n"
			result.n = n
			result.service = "iTunes"
			$("#col3").append Mustache.to_html($('#result_template').html(), result)
		
		if data['Netflix'].length
			for result,i in data['Netflix']
				if i<3
					n = i+1
				else
					n = "n"
				result.n = n
				$("#col4").append Mustache.to_html($('#netflix_template').html(), result)
		else
			$("#col4").append Mustache.to_html($('#empty_template').html(), {service: "Netflix"})
		
		if reload #show right away on "back button"
			$("#search_form").show()
			if data['TopResult']
				$("#top_result").show()
			if data['MixedResults']
				$("#mixed_results").show()
			$(".result").show()
		else #show for the first time
			$("#search_form").fadeIn(2000)
			if data['TopResult']
				$("#top_result").fadeIn(2000)
			if data['MixedResults']
				$("#mixed_results").fadeIn(2000)
			$(".result").fadeIn(2000)
			
	displayError = ->
		$("#search_error").show()
