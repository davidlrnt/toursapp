class ToursController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_tour, only: [:show, :get_directions, :edit, :update, :destroy, :participate, :quit, :amazon, :publish, :mobiletour]

  def new
    @tour = Tour.new
  end

  def edit
  end

  def amazon
    @tour.images.create(image_url: params["key"])
    redirect_to @tour
  end

  def mobiletour
    @nextlocations = @tour.locations.select do |location|
      !current_user.checked_in_locations.include?(location)
    end
  end

  def create
    city = set_city
    if params["tour"]["cities_attributes"]["0"]["name"].empty?
      flash[:alert] = "You have to give a city."
      redirect_to(:back)
    elsif city.nil?
      flash[:alert] = "This city isn't currently available."
      redirect_to(:back)
    else
    @tour = Tour.new(tour_params)
    @tour.cities << city
		@tour.tags << set_tags
    current_user.tours << @tour
		# current_user.get_badge
    respond_to do |format|
      if @tour.save
        @uploader = Tour.new.image
        @uploader.success_action_redirect = "http://localhost:3000/tours/#{@tour.id}/amazon"
        format.html { render "imageupload", notice: 'Tour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tour }
      else
        format.html { render action: 'new' }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  def show
		@comment = Comment.new
    @user = current_user
    if @tour.guide == current_user
      @location = Location.new
      render 'guide_show'
    elsif @tour.participants.include?(current_user)
      @progress = @tour.progress(@user)
      render 'participants_show'
    else
      render 'non_participants_show'
    end
  end

  def update
    respond_to do |format|
      city = set_city
      @tour.cities << city
      @tour.tags << set_tags
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

	def participate
		user = User.find_by(id: params[:user_id])
		@tour.participate(user)
		binding.pry
		redirect_to @tour
	end

	def quit
		user = User.find_by(id: params[:user_id])
		@tour.quit(user)
		redirect_to root_path
	end

  def get_directions
    @directions = @tour.get_directions
    render 'directions'
  end

	def publish
		@tour.update(published: true)
		redirect_to tour_path(@tour)
	end

private
  def tour_params
    params.require(:tour).permit(:title, :description, :category_id, :tour_id )
  end

  def set_city
    city = params.require(:tour).permit(:cities_attributes => [:id, :name])
    City.find_by(name: city["cities_attributes"]["0"]["name"])
  end

  def set_tags
    tags = params.require(:tour).permit(:tags_attributes => [:id, :name])["tags_attributes"]["0"]["name"].split(",")
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
