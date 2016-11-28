class Shift < ApplicationRecord
has_many :employee, through: :employee_has_shift
end
