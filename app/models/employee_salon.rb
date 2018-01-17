class EmployeeSalon < ApplicationRecord
  belongs_to :employee
  belongs_to :salon
  belongs_to :employee, inverse_of: :employee_salons
  has_and_belongs_to_many :weekdays

  has_paper_trail
end
