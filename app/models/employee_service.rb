class EmployeeService < ApplicationRecord
  belongs_to :employee, inverse_of: :employee_services
  belongs_to :service, inverse_of: :employee_services

  has_paper_trail
end
