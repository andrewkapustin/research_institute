# console.log('<%= @employee.inspect %>')
ids = []
$('.employee-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )

id = "<%= @employee.try(:id) %>"
firstEmployee = !ids.includes(+id)
timestamp = "<%= @timestamp %>"
employee = ("<%= @employee.nil? %>" == 'false')
selectorPrefix = "#project_employee_project_communications_attributes_"
if employee && firstEmployee
  first_name           = "<%= @employee.try(:first_name) %>"
  last_name           = "<%= @employee.try(:last_name) %>"
  patronymic           = "<%= @employee.try(:patronymic) %>"
  passport = "<%= @employee.try(:passport) %>"
  itn = "<%= @employee.try(:itn) %>"
  date_of_birth     = "<%= @employee.try(:date_of_birth) %>"
  post         = "<%= @employee.try(:post) %>"
else
  if !firstEmployee
    $(selectorPrefix + timestamp + '_employee_id').val(0)
  first_name           = ""
  last_name           = ""
  patronymic           = ""
  passport = ""
  itn = ""
  date_of_birth     = ""
  post         = ""

$(selectorPrefix + timestamp + '_employee_attributes_id').val( id )
$(selectorPrefix + timestamp + '_employee_attributes_first_name').val( first_name )
$(selectorPrefix + timestamp + '_employee_attributes_last_name').val( last_name )
$(selectorPrefix + timestamp + '_employee_attributes_patronymic').val( patronymic )
$(selectorPrefix + timestamp + '_employee_attributes_passport').val( passport )
$(selectorPrefix + timestamp + '_employee_attributes_itn').val( itn )
$(selectorPrefix + timestamp + '_employee_attributes_date_of_birth').val( date_of_birth )
$(selectorPrefix + timestamp + '_employee_attributes_post').val( post )
