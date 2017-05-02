class Project < ActiveRecord::Base
  has_many :employee_project_communications

  validates :name, length: {maximum: 30}, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validate :start_date_can_not_be_more_than_finish_date

  def start_date_can_not_be_more_than_finish_date
    if start_date > finish_date
      errors.add(:start_date, "не может быть больше даты окончания")
    end
  end

end
