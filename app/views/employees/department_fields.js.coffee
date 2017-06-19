condition = ('<%= @department.nil? %>' == 'true')
if condition
  $('#employee_department_attributes_id').val('')
  $('#employee_department_attributes_name').val('')
else
  $('#employee_department_attributes_id').val('<%= @department.try(:id) %>')
  $('#employee_department_attributes_name').val('<%= @department.try(:name) %>')
console.log('отработал')
