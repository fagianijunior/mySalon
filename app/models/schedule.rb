class Schedule < ApplicationRecord
  belongs_to :user, inverse_of: :schedules
  has_many :schedule_services, dependent: :destroy, inverse_of: :schedule

  accepts_nested_attributes_for :schedule_services, allow_destroy: true

  has_paper_trail

  validates :date, :schedule_service_ids, presence: true
  validates :cpf, :rg, uniqueness: true, allow_blank: true
end
