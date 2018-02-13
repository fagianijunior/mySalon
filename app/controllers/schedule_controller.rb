class ScheduleController < ApplicationController
  def index
    @schedules = Schedule.where(user: current_user).all
  end

  def new
    @services = Service.all
    @categories = Category.order(:name).all

    @salons = Salon.all
    @employees = Employee.all
    @hair_sizes = HairSize.all
    @schedule_services = ScheduleService.all
  end
end
