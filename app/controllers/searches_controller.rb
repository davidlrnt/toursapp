class SearchesController < ApplicationController

  def create
    if params[:search][:city].empty?
      flash[:alert] = "City field can not be empty"
      return redirect_to root_path
    end
    @search = Search.new(search_params)
    @tours = @search.get_tours
    render 'results'
  end

  def show_city
    # binding.pry
    @search = Search.new
    @search.city = params["id"]
    @tours = @search.get_tours
    render 'results'
  end

  def show
  end

private

  def search_params
    params.require(:search).permit(:city, :category, :tags)
  end
end
