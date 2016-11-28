class Invoice < ApplicationRecord
    has_many :product, through: :invoice_has_product
end
