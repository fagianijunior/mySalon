class Salon < ApplicationRecord

  belongs_to :state
  belongs_to :city
  belongs_to :district
  has_many :salon_phones, dependent: :destroy, inverse_of: :salon

  accepts_nested_attributes_for :salon_phones, allow_destroy: true

  has_paper_trail
  
  def full_address
    [self.street, self.number, self.complement, self.district.name, self.city.name, self.state.name].compact.join(', ')
  end
end
