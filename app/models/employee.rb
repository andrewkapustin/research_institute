class Employee < ActiveRecord::Base
  belongs_to :department
  accepts_nested_attributes_for :department

  has_many :employee_project_communications, dependent: :destroy
  accepts_nested_attributes_for :employee_project_communications,
    reject_if: proc { |attrs| attrs[:project_id].blank? }, allow_destroy: true

  has_many :projects, through: :employee_project_communications

  validates :last_name, length: {minimum: 2, maximum: 20}
  validates :first_name, length: {minimum: 2, maximum: 20}
  validates :patronymic, length: {maximum: 20}
  validates :passport, length: {is: 10}, uniqueness: true
  validates :itn, length: {is: 12}, uniqueness: true
  validates :date_of_birth, presence: true
  validates :post, presence: true, length: {maximum: 30}
  validates :department, presence: true
  validate :date_of_birth_cannot_be_in_the_future

  def date_of_birth_cannot_be_in_the_future
    unless date_of_birth.nil?
      if date_of_birth > Date.today
        errors.add(:date_of_birth, "не может быть в будущем")
      end
    end
  end
  def initials
    return (first_name.first + "\." + patronymic.first + "\." + last_name)
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end

  def self.search(params)
     result = Employee.includes({:employee_project_communications => :project}, :department).references({:employee_project_communications => :project}, :department)
     if params['last_name'].present?
       result = result.where(last_name: params['last_name'])
     end
     if params['name_dep'].present?
       result = result.where(departments: {name: params['name_dep']})
     end
     if params['first_name'].present?
       result = result.where(first_name: params['first_name'])
     end
     if params['patronymic'].present?
       result = result.where(patronymic: params['patronymic'])
     end
     if params['passport'].present?
       result = result.where(passport: params['passport'])
     end
     if params['itn'].present?
       result = result.where(itn: params['itn'])
     end
     if params['date_of_birth'].present?
       result = result.where(date_of_birth: params['date_of_birth'])
     end
     if params['post'].present?
       result = result.where(post: params['post'])
     end
     if params['name'].present?
       result = result.where(projects: {name: params['name']})
     end
     if params['start_date'].present?
       result = result.where(projects: {start_date: params['start_date']})
     end
     if params['finish_date'].present?
       result = result.where(projects: {finish_date: params['finish_date']})
     end
     if params['price'].present?
       result = result.where(projects: {price: params['price']})
     end

     result.all
  end

end
