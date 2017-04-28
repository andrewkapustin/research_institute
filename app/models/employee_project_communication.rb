class EmployeeProjectCommunication < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee

  validates :project_id, :employee_id, presence: true
end
