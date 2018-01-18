class SalonPhone < ApplicationRecord
  belongs_to :salon, inverse_of: :salon_phones

  has_paper_trail

  validates :number, presence: true
  validates :number, uniqueness: { scope: :salon_id,
    message: "This salon already has this phone number!" }

  def title
    self.try(:number)
  end
end
