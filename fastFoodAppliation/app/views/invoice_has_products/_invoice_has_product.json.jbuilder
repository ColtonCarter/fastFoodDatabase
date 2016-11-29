json.extract! invoice_has_product, :id, :order_id, :product_id, :product_quantity, :created_at, :updated_at
json.url invoice_has_product_url(invoice_has_product, format: :json)