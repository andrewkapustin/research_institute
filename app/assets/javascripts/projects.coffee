datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_employee_fields = ->
  $('select[id$=employee_id]').on 'change', (e) ->
    currentEmployee = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    $.ajax
      url: '/employee_fields'
      type: 'POST'
      dataType: 'script'
      data: { employee_id: currentEmployee, timestamp: timestamp }

# $(document).on 'page:load', ->

ready_for_fill_nested_employee = ->
  fill_employee_fields()
  $('#employees').on 'cocoon:after-insert', (event, item) ->
    $('select[id$=employee_id]').off('change')
    datepicker_activation_by_item(item)
    fill_employee_fields()

$(document).ready ready_for_fill_nested_employee
# $(document).on 'turbolinks:load', ready_for_fill_nested_employee
$(document).on 'page:load', ready_for_fill_nested_employee
