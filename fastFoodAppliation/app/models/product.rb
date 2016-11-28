class Product < ApplicationRecord
    has_many :invoice, through: :invoice_has_product
end
