class Address < ApplicationRecord
  belongs_to :user, :inverse_of => :address
  belongs_to :state
  belongs_to :city
  belongs_to :district

  def full_address

    [self.street, self.number, self.complement, self.district.name, self.city.name, self.state.name].compact.join(', ')
  end
end
