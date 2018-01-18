class Phone < ApplicationRecord
  belongs_to :user, inverse_of: :phones

  has_paper_trail

  validates :number, presence: true
  validates :number, uniqueness: { scope: :user_id,
    message: "The user already has this phone number!" }

  def title
    self.try(:number)
  end
end
