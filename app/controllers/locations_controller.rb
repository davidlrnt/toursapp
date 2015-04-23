class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :checkin, :checkin_static]

  def index

  end

  def edit
  end

  def show
  end

  def create
    tour = Tour.find(params["tour_id"])
    @location = Location.new(location_params)
    if @location.save
      tour.locations << @location
      @location.update(@location.get_coordinates)
      flash[:notice] = "Successfully Add location"
      redirect_to "/tours/#{tour.id}"
    else
      flash[:alert] = "Necessary forms need to be filled in."
      redirect_to(:back)
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        @location.update(@location.get_coordinates)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to @tour }
      format.json { head :no_content }
    end
  end

  def checkin_static
    current_user.checkin_static(@location)
    redirect_to @tour
  end

  def checkin
    if current_user.checkin(@location, params["position"]["coords"]) == "wrong location"
      respond_to do |format|
          format.json { render json: "error".to_json }
      end
    else
      respond_to do |format|
          format.json { render json: "ok".to_json }
      end
    end
  end

private
  def location_params
    params.require(:location).permit(:title, :address, :lat, :lng, :step, :description, :image_url)
  end

  def set_location
    @location = Location.find(params[:id])
    @tour = Tour.find(params[:tour_id])
  end
end
