class Employee < ApplicationRecord
  belongs_to :user, :inverse_of => :employee
end
