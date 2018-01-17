class Salon < ApplicationRecord

  belongs_to :state
  belongs_to :city
  belongs_to :district
  has_many :salon_phones, dependent: :destroy, inverse_of: :salon

  has_many :employee_salons, inverse_of: :salon
  has_many :employees, through: :employee_salons
  accepts_nested_attributes_for :salon_phones, allow_destroy: true

  has_paper_trail

  def full_address
    [self.street, self.number, self.complement, self.district.name, self.city.name, self.state.name].reject(&:blank?).compact.join(', ')
  end
end
