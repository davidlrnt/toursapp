class SearchesController < ApplicationController

  def create
    if params[:search][:city].empty?
      flash[:alert] = "City field can not be empty"
      return redirect_to root_path
    end
    @search = Search.new(search_params)
    @tours = @search.get_tours
    binding.pry
    render 'results'
  end

  def show
  end

private

  def search_params
    params.require(:search).permit(:city, :category, :tags)
  end
end
