class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
    @user = User.create(current_user)
  end

  def destroy
  end

  def update
  end

end
