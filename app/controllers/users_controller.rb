class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def index
  end

  def update
  end

  def show
    @trips = current_user.trips
  end

  def edit
    binding.pry
  end


  def destroy
  end

  def update
  end

  def set_user
    @user = current_user
  end

end
