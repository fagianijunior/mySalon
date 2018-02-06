class ScheduleService < ApplicationRecord
  belongs_to :schedule, dependent: :destroy, inverse_of: :schedule_services
  belongs_to :salon
  belongs_to :employee
  belongs_to :service

  has_paper_trail
end
