class TagSuggestionsController < ApplicationController
	def index
		render json: %w[foo bar]
	end
end
