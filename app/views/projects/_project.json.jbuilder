json.extract! project, :id, :name, :start_date, :finish_date, :price, :created_at, :updated_at
json.url project_url(project, format: :json)
