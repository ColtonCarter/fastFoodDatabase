json.extract! phone, :id, :phone_id, :phone_area_code, :phone_telephone_exchange, :phone_assigned_number, :person_id, :created_at, :updated_at
json.url phone_url(phone, format: :json)