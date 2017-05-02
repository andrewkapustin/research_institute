class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :employee_project_communications

  validates :last_name, length: {minimum: 2, maximum: 20}
  validates :first_name, length: {minimum: 2, maximum: 20}
  validates :patronymic, length: {maximum: 20}
  validates :passport, length: {is: 10}, uniqueness: true
  validates :itn, length: {is: 12}, uniqueness: true
  validates :date_of_birth, presence: true
  validates :post, presence: true, length: {maximum: 30}
  validates :department_id, presence: true
  validate :date_of_birth_cannot_be_in_the_future

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "не может быть в будущем")
    end
  end

end
