class Employee < ApplicationRecord
belongs_to :person
  has_many :order
  has_many :employee_has_shift
  has_many :shift, through: :employee_has_shift
end
