class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def personal_show
    @user = current_user
    @tours = current_user.tours
    @trips = current_user.trips
  end

  def public_show
    @user = User.find_by(id: params[:id])
    @trips = @user.trips
    @tours = @user.tours
  end










private
  def set_user
    @user = current_user
  end

end
