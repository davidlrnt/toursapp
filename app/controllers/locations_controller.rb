class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
  end

  def edit
  end

  def create
    tour = Tour.find(params["tour_id"])
    @location = tour.locations.create(location_params)
    @location.update(@location.get_coordinates)
    redirect_to "/tours/#{tour.id}"
  end

private
  def location_params
    params.require(:location).permit(:title, :address, :lat, :lng, :step)
  end

  def set_location
    @location = Location.find(params[:id])
    @tour = Tour.find(params[:tour_id])
  end

end

