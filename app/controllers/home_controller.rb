class HomeController < ApplicationController

  def index
    @search = Search.new
    @video = Dir.entries("./app/assets/videos").select{|x| /\w+.mp4/.match(x)}.sample
  end

  def show
    redirect_to user_registration_path
  end

  def greeting
    render :index
  end

end
