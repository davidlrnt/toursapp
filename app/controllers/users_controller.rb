class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def edit
    binding.pry
    @image = Image.new
  end

  def show
    if @user.id == params["id"].to_i
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
