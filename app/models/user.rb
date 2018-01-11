class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :gender, :cpf, presence: true

  belongs_to :gender
  has_many :phones, :dependent => :destroy, :inverse_of => :user
  has_one :address, :dependent => :destroy, :inverse_of => :user
  has_one :employee, :dependent => :destroy, :inverse_of => :user

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :employee, allow_destroy: true
end
