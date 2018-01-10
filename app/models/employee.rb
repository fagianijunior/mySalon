class Employee < ApplicationRecord
  before_save :set_employee_role
  after_commit :delete_employee_role, on: :destroy

  belongs_to :user

  def set_employee_role
    if !self.user.employee_role?
      self.user.update_columns(employee_role: true)
    end
  end

  def delete_employee_role
    if self.user.employee_role?
      self.user.update_columns(employee_role: false)
    end
  end
end
