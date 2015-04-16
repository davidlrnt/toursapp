class SearchesController < ApplicationController

  def create
    @search = Search.new(search_params)
    binding.pry
    # redirect_to result_tour_path
  end

  def show
  end



private

  def search_params
    params.require(:search).permit(:city, :category, :tags)
  end
end
