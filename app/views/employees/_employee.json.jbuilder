json.extract! employee, :id, :last_name, :first_name, :patronymic, :passport, :itn, :date_of_birth, :post, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
