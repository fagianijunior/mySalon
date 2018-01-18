class State < ApplicationRecord
  has_many :cities, inverse_of: :state

  has_paper_trail

  validates :name, presence: true, uniqueness: true
end
