class Phone < ApplicationRecord
  belongs_to :user, inverse_of: :phones
  
  has_paper_trail
end
