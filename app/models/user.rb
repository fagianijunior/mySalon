class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_paper_trail

  validates :name, :gender, :cpf, presence: true

  belongs_to :gender
  has_many :phones, dependent: :destroy, inverse_of: :user
  has_one :address, dependent: :destroy, inverse_of: :user
  has_one :employee, dependent: :destroy, inverse_of: :user

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :employee, allow_destroy: true

  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "active" column
    super and self.active?
  end
end
