class UsersController < ApplicationController
    before_action :authenticate_user!
  def index
  end

  def update
    binding.pry
  end

  def show
  end

  def edit
    binding.pry
  end
  private

  def user_params
    params.require(:user).permit(:name, :gender, :dob, :email)
  end
end
