# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  # console.log("Jobs page loaded");
  # job_status = document.getElementById("job_status");
  job_status_set = document.getElementsByTagName("select");

  console.log(job_status_set.length + " selects found");

  for job_status in job_status_set
    do ->
      $('#' + job_status.id).on 'change', ->
        console.log("Selected " + this.id + ": " + this.value);

        formName = "edit_job_" + this.id;
        form = document.getElementById(formName);
        # console.log(form);
        form.submit();


