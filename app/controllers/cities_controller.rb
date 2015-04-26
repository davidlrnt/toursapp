class CitiesController < ApplicationController

	def show
		@city = City.find_by_id(params[:id])
		@tours = @city.tours.where(published: true)
	end



end
