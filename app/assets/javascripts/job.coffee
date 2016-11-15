# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->

  job_status = document.getElementById("job_status");

  $('#job_status').on 'change', ->
    console.log("Selected " + job_status.value);

    forms = document.getElementsByTagName("form");
    # console.log(this);
    forms[0].submit();
