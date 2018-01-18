class District < ApplicationRecord
  belongs_to :city, :inverse_of => :districts

  has_paper_trail

  validates :name, presence: true
  validates :name, uniqueness: { scope: :city_id,
    message: "District already exist in this City!" }
end
