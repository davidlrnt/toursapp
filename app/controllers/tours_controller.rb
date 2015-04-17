class ToursController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

	def index
		@tours = Tour.all
	end

  def new
    @tour = Tour.new
  end

  def create
    city = set_city
    @tour = Tour.new(tour_params)
    @tour.cities << city
    @tour.tags << set_tags
    current_user.tours << @tour
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
    # binding.pry
    if @tour.guide == current_user
      @location = Location.new
      render 'guide_show'
    else
      render 'non_participants_show'
    end
  end

private
  def tour_params
    params.require(:tour).permit(:title, :description, :category_id )
  end

  def set_city
    city = params.require(:tour).permit(:cities_attributes => [:id, :name])
    City.find_by(name: city["cities_attributes"]["0"]["name"])
  end

  def set_tags
    tags = params.require(:tour).permit(:tags_attributes => [:id, :name])["tags_attributes"]["0"]["name"].split(", ")
    returntags = []
    tags.each do |tag|
      returntags << Tag.find_or_create_by(name: tag)
    end
    returntags.uniq
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
