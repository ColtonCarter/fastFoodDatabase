json.extract! employee, :id, :employee_id, :date_hired, :wage, :person_id, :postion_id, :status_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)