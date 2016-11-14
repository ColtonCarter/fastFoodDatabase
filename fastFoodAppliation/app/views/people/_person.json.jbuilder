json.extract! person, :id, :person_id, :person_first_name, :person_last_name, :created_at, :updated_at
json.url person_url(person, format: :json)