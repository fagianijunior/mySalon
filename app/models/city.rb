class City < ApplicationRecord
  belongs_to :state, inverse_of: :cities
  has_many :districts, inverse_of: :city
end
