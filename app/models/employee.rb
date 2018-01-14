class Employee < ApplicationRecord
  belongs_to :user, inverse_of: :employee

  has_many :employee_services, inverse_of: :employee
  has_many :services, through: :employee_services

  accepts_nested_attributes_for :employee_services, allow_destroy: true

  has_paper_trail
end
