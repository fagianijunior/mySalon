class Service < ApplicationRecord
  has_many :employee_services, inverse_of: :service

  has_paper_trail

  validates :name, :minimum_time, :maximum_time, :price, presence: true
  validates :name, uniqueness: true
end
