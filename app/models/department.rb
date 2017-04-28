class Department < ActiveRecord::Base
  has_many :employees

  validates :name, length: {maximum: 64}, presence: true, uniqueness: true
end
