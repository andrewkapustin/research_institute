class Project < ActiveRecord::Base
  has_many :employee_project_communications

  validates :name, length: {maximum: 30}, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
