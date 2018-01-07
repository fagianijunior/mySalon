class User < ApplicationRecord
  validates :name, :gender, :cpf, :rg, presence: true
  belongs_to :gender
end
