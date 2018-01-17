class Address < ApplicationRecord
  belongs_to :user, :inverse_of => :address
  belongs_to :state
  belongs_to :city
  belongs_to :district

  has_paper_trail

  def full_address
    [self.street, self.number, self.complement, self.district.name, self.city.name, self.state.name].reject(&:blank?).compact.join(', ')
  end
end
