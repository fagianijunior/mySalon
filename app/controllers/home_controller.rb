class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @salons = Salon.all
    @employees = Employee.all
    @services = Service.all
    @categories = Category.order(:name).all
    @hair_sizes = HairSize.all
    @schedule_services = ScheduleService.all
  end

  def show_services
    respond_to do |format|
    format.js
  end
  end
end
