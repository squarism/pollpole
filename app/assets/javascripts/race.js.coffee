# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@start_dj_race = () ->
  request = $.getJSON '/race/new/delayed_job.json'
  request.success (data) -> 
    # debug
    # for key,value of data
      # $('.float_left').append "<pre>#{key}: #{value}</pre>"
    check_job_status data.job
    # we don't have a score id until now
    $('#score_id_row td:nth-child(2)').html(data.score_id)
    # console.log data
  request.error (jqXHR, textStatus, errorThrown) ->
    $('#main').append "AJAX Error: ${textStatus}."
    console.log errorThrown

# this method is continually refreshed until the race is finished
# the json call will return an error if a delayed_job task is not found
refresh_loop = (data) ->
  if !data.error
    # console.log(data.handler)
    # matches = data.handler.match(/started\:\s+(\w+)\s+/)
    # started = matches[0].split(":")[1].replace /^\s+|\s+$/g, ""
    # matches = data.handler.match(/finished\:\s+(\w+)\s+/)
    # finished = matches[0].split(":")[1].replace /^\s+|\s+$/g, ""
    # if (started == "false" && finished == "false")
    check_job_status(data.id)
  else
    console.log "Job probably done: #{data.error}"
    # this would be best to put into a hidden field
    score_id = $('.race_table tr:last td:nth-child(2)').text()
    get_score(score_id)

@check_job_status = (job_id) ->
  console.log "checking race status of: #{job_id}"
  setTimeout((->
    $.getJSON "/delayed_job/#{job_id}", (data) ->
      refresh_loop(data, 500)
  ), 500)

# after the race is done, get the posted DB score and update the UI (this is async)
@get_score = (score_id) ->
  request = $.getJSON "/race/#{score_id}"
  request.success (data) ->
    console.log data
    $('.race_table tr:first td:nth-child(2)').html(data.time)
    $('.race_table tr:nth-child(2) td:nth-child(2)').html(data.judge)
    $('.race_table tr:nth-child(3) td:nth-child(2)').html(data.racer)
    $('.flash').html("Done.")
  