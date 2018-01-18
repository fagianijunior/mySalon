class Weekday < ApplicationRecord

  has_paper_trail

  validates :name, presence: true
  validates :name, uniqueness: true
end
