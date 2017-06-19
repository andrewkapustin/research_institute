class EmployeeProjectCommunication < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :employee

  validates :project_id, uniqueness: { scope: :employee_id,
    message: 'Такой проект уже связан с таким работником'}
end
