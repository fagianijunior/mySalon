class Address < ApplicationRecord
  belongs_to :user, :inverse_of => :address
  belongs_to :state
  belongs_to :city
  belongs_to :district
end
