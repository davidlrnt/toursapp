class HomeController < ApplicationController
  def index
    render :index
  end

  def show
    redirect_to user_registration_path
  end
end
