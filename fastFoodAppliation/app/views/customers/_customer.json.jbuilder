json.extract! customer, :id, :customer_id, :person_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)