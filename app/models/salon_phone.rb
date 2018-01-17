class SalonPhone < ApplicationRecord
  belongs_to :salon, inverse_of: :salon_phones

  has_paper_trail

  def title
    self.try(:number)
  end
end
