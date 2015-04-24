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
    if @user.id == params["id"].to_i
      @uploader = User.new.image
      @uploader.success_action_redirect = "http://localhost:3000/users/#{@user.id}/amazon"
      @tours = @user.tours
      @trips = @user.trips
      render 'personal_show'
    else
      @user = User.find(params["id"])
      @tours = @user.tours
      @trips = @user.trips
      render 'public_show'
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
