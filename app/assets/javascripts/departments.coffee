department_selector_handler = (e) ->
  $.ajax
    url: '/department_fields',
    type: 'POST',
    dataType: 'script',
    data: {
      department_id: +$(this).val()
    },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("AJAX DONE!")

$(document).on 'turbolinks:load', ->
$('#select_existing_department').on 'change', department_selector_handler
