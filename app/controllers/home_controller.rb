class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @salons = Salon.all
    @employees = Employee.all
    @services = Service.all
    @categories = Category.all
    @hair_sizes = HairSize.all
  end
end
