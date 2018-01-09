class District < ApplicationRecord
  belongs_to :city, :inverse_of => :districts
end
