class Service < ApplicationRecord
  has_many :employee_services, inverse_of: :service
  
  has_paper_trail
end
