# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#errand_select").change((event) ->
    x = $(event.target).find(":selected").val()
    # alert x
    if x.trim()
      $("#errand_other").hide()
    else
      $("#errand_other").show()
    # $("#errand_other").hide()
    )
