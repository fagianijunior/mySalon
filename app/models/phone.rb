class Phone < ApplicationRecord
  belongs_to :user, inverse_of: :phones
end
