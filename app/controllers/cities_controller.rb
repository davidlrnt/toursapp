class CitiesController < ApplicationController

	def show
    binding.pry
		@city = City.find_by_id(params[:id])
    @tours = Tour.joins(:cities).where(cities: {name: @city.name.downcase})
    binding.pry
	end



end
