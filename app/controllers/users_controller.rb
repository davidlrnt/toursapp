class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(params[:id])
    @trips = current_user.trips
  end

  def update
  end

  def show
  end

  def edit
    binding.pry
  end


  def destroy
  end

  def update
  end

end
