class Project < ActiveRecord::Base
  has_many :employee_project_communications

  has_many :employees, through: :employee_project_communications

  accepts_nested_attributes_for :employee_project_communications,
  reject_if: proc { |attrs| attrs[:employee_id].blank? }, allow_destroy: true

  validates :name, length: {maximum: 30}, presence: true,
  uniqueness: {scope: [:start_date, :finish_date], message: "с такой датой начала и окончания уже существует" }
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validate :start_date_can_not_be_more_than_finish_date

  def start_date_can_not_be_more_than_finish_date
    unless start_date.nil?
      unless start_date.nil?
        if start_date > finish_date
          errors.add(:start_date, "не может быть больше даты окончания")
        end
      end
    end
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end

end
