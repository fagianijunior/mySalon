class Category < ApplicationRecord
  has_many :services, inverse_of: :category

  validates :name, presence: true, uniqueness: true
end
