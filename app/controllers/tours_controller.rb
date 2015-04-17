class ToursController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]

  def new
    @tour = Tour.new
  end

  def create
    ## PENDING!!!!! IF TOUR PARAMS INCLUDES CITY, TOUR.CREATE! WILL CREATE THAT CITY, FIGURE OUT WHERE THAT IS HAPPENING BEHIND THE SCENES AND CHANGE WHERE THE CITY IS BEING CREATED TO FIND_BY INSTEAD
    city = set_city
    @tour = Tour.create!(tour_params)
    @tour.cities << city
    # binding.pry
    redirect_to tour_locations_url
  end


private
  def tour_params
    params.require(:tour).permit(:title, :description, :category_id, :tags_attributes => [:id, :name])
  end

  def set_city
    city = params.require(:tour).permit(:cities_attributes => [:id, :name])
    # binding.pry
    City.find_by(name: city["cities_attributes"]["0"]["name"])
  end
end
