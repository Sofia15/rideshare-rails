class DriversController < ApplicationController
  # DONE: drivers GET    /drivers(.:format)             drivers#index
  # POST   /drivers(.:format)             drivers#create
  # new_driver GET    /drivers/new(.:format)         drivers#new
  # edit_driver GET    /drivers/:id/edit(.:format)    drivers#edit
  # driver GET    /drivers/:id(.:format)         drivers#show
  # PATCH  /drivers/:id(.:format)         drivers#update
  # PUT    /drivers/:id(.:format)         drivers#update
  # DELETE /drivers/:id(.:format)         drivers#destroy

  def index
    @drivers = Driver.all
  end

  def create
    Driver.create(driver_params)

    redirect_to drivers_path
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def show
    @driver = Driver.find_by_id(params[:id].to_i)
  end

  def update
    driver = Driver.find(params[:id])
    driver.update(driver_params)
  end


  def destroy
    driver = Driver.find(params[:id])
    driver.destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:driver_id, :name, :vin)
  end
end
