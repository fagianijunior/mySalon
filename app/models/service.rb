class Service < ApplicationRecord
  has_many :employee_services, inverse_of: :service
  belongs_to :category, inverse_of: :services
  belongs_to :gender
  belongs_to :hair_size, optional: true
  has_paper_trail

  validates :name, :minimum_time, :maximum_time, :price, presence: true

  def title
    "#{self.try(:name)} #{self.category.try(:name)} #{self.hair_size.try(:name)} #{self.gender.try(:name)} - R$ #{self.try(:price)}"
  end
end
