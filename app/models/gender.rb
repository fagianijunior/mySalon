class Gender < ApplicationRecord

  has_many :services, inverse_of: :gender

  has_paper_trail

  validates :name, presence: true, uniqueness: true

end
