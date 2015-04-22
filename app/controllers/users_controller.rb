class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def index
  end

  def update
  end

  def show
    @trips = current_user.trips
    if @user.id == params["id"].to_i
      render 'private_show'
    else
      @user = User.find(params["id"])
      render 'public_show'
    end
  end

  def edit
  end


  def destroy
  end

  def update
  end

  def set_user
    @user = current_user
  end

end
