class State < ApplicationRecord
  has_many :cities, inverse_of: :state
  
  has_paper_trail
end
