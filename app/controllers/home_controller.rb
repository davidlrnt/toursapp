class HomeController < ApplicationController

  def index
    @search = Search.new
  end

  def show
    redirect_to user_registration_path
  end

  def greeting
    render :index
  end

end
