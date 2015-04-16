class UsersController < ApplicationController
    before_action :authenticate_user!
  def index
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :dob, :email)
  end
end
