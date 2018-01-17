class Employee < ApplicationRecord
  belongs_to :user, inverse_of: :employee

  has_many :employee_services, inverse_of: :employee
  has_many :services, through: :employee_services

  has_many :employee_salons, inverse_of: :employee
  has_many :salons, through: :employee_salons

  accepts_nested_attributes_for :employee_services, allow_destroy: true
  accepts_nested_attributes_for :employee_salons, allow_destroy: true

  has_paper_trail

  def name
    self.try(:user).try(:name)
  end

end
