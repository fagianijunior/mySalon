class Service < ApplicationRecord
  has_many :employee_services, inverse_of: :service
end
