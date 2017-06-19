datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_project_fields = ->
  $('select[id$=project_id]').on 'change', (e) ->
    console.log('drowdown menu changed')
    currentProject = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    $.ajax
      url: '/project_fields'
      type: 'POST'
      dataType: 'script'
      data: { project_id: currentProject, timestamp: timestamp }

department_selector_handler = (e) ->
  $('#select_existing_department').on 'change', (e) ->
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

ready_for_fill_nested_projects = ->
  department_selector_handler()
  fill_project_fields()
  $('#projects').on 'cocoon:after-insert', (event, item) ->
    console.log('nested forms added')
    $('select[id$=project_id]').off('change')
    datepicker_activation_by_item(item)
    fill_project_fields()

$(document).ready ready_for_fill_nested_projects
# $(document).on 'turbolinks:load', ready_for_fill_nested_projects
$(document).on 'page:load', ready_for_fill_nested_projects
