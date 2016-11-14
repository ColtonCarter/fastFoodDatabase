json.extract! invoice, :id, :invoice_id, :invoice_time, :employee_id, :customer_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)