class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :amazon]

  def edit
    binding.pry
  end

  def amazon
    binding.pry
    @user.images.create(image_url: params["key"])
    redirect_to @user
  end

  def show
    if @user.nil? || (!@user.nil? && !(@user.id == params["id"].to_i))
      @user = User.find(params["id"])
      @tours = @user.tours
      @trips = @user.trips
      render 'public_show'
    else
      @uploader = User.new.image
      @uploader.success_action_redirect = "/users/#{@user.id}/amazon"
      @tours = @user.tours
      @trips = @user.trips
      @user.get_badge
      render 'personal_show'
    end
  end

private
  def set_user
    @user = current_user
  end

  def reg_params
    params.require(:user).permit(:name, :image, :email, :location, :gender, :dob, :average_score)
  end
end
