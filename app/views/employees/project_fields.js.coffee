ids = []
$('.project-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )

id = "<%= @project.try(:id) %>"
firstProject = !ids.includes(+id)

timestamp = "<%= @timestamp %>"
project = ("<%= @project.nil? %>" == 'false')
selectorPrefix = "#employee_project_communications_attributes_"

if project && firstProject
  name         = "<%= @project.try(:name) %>"
  start_date   = "<%= @project.try(:start_date) %>"
  finish_date  = "<%= @project.try(:finish_date) %>"
  price        = "<%= @project.try(:price) %>"
else
  if !firstProject
    $(selectorPrefix + timestamp + '_project_id').val(0)
  id           = ""
  name         = ""
  start_date   = ""
  finish_date  = ""
  price        = ""

$(selectorPrefix + timestamp + '_project_attributes_id').val( id )
$(selectorPrefix + timestamp + '_project_attributes_name').val( name )
$(selectorPrefix + timestamp + '_project_attributes_start_date').val( start_date )
$(selectorPrefix + timestamp + '_project_attributes_finish_date').val( finish_date )
$(selectorPrefix + timestamp + '_project_attributes_price').val( price )
