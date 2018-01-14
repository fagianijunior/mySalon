class District < ApplicationRecord
  belongs_to :city, :inverse_of => :districts

  has_paper_trail
end
