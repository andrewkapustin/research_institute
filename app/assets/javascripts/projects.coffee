datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_project_fields = ->
  $('select[id$=employee_id]').on 'change', (e) ->
    currentEmployee = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    $.ajax
      url: '/employee_fields'
      type: 'POST'
      dataType: 'script'
      data: { employee_id: currentEmployee, timestamp: timestamp }

# $(document).on 'turbolinks:load', ->
$(document).on 'page:load', ->
  fill_project_fields();
  $('#employees').on 'cocoon:after-insert', (event, item) ->
    $('select[id$=employee_id]').off('change')
    datepicker_activation_by_item(item)
    fill_project_fields()
