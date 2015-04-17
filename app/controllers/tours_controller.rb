class ToursController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def new
    @tour = Tour.new
  end

  def create
    city = set_city
    @tour = Tour.new(tour_params)
    @tour.cities << city
    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tour }
      else
        format.html { render action: 'new' }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
		binding.pry
    @location = Location.new
  end

private
  def tour_params
    params.require(:tour).permit(:title, :description, :category_id, :tags_attributes => [:id, :name])
  end

  def set_city
    city = params.require(:tour).permit(:cities_attributes => [:id, :name])
    City.find_by(name: city["cities_attributes"]["0"]["name"])
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
