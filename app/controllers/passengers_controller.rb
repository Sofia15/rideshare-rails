class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new

  end

  def create
    Passenger.create(passenger_params)
    redirect_to passenger_path
  end

  def show
    @passenger = Passenger.find(params[:id])
    @trips_by_passenger = @passenger.trips
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update #not passing into view so could be local variable
    passenger = Passenger.find(params[:id])
    passenger.update_attributes(passenger_params)
    passenger.save

    redirect_to passengers_path
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy

    redirect_to passengers_path
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num) #coming from the form
  end


end
