datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_project_fields = ->
  $('select[id$=project_id]').on 'change', (e) ->
    currentProject = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    $.ajax
      url: '/project_fields'
      type: 'POST'
      dataType: 'script'
      data: { project_id: currentProject, timestamp: timestamp }

# $(document).on 'turbolinks:load', ->
$(document).on 'page:load', ->
  fill_project_fields();
  $('#projects').on 'cocoon:after-insert', (event, item) ->
    $('select[id$=project_id]').off('change')
    datepicker_activation_by_item(item)
    fill_project_fields()
