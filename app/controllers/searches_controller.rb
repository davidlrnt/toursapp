class SearchesController < ApplicationController

  def create
    @search = Search.new(search_params)
<<<<<<< HEAD
=======
    @tours = @search.get_tours
    render 'results'
>>>>>>> 5ea133cadc4495bb590ff8e0b43ae33aacdbe8e4
  end

  def show
  end



private

  def search_params
    params.require(:search).permit(:city, :category, :tags)
  end
end
