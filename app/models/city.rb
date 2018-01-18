class City < ApplicationRecord
  belongs_to :state, inverse_of: :cities
  has_many :districts, inverse_of: :city

  has_paper_trail

  validates :name, presence: true
  validates :name, uniqueness: { scope: :state_id,
    message: "City already exist in this State!" }

end
