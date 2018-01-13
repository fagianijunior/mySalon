class State < ApplicationRecord
  has_many :cities, inverse_of: :state
end
