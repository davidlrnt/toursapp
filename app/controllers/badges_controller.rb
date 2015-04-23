class BadgesController < ApplicationController
	before_action :set_user, only: [:index]

	def index
		binding.pry
	end

private

	def set_user
		@user = User.find_by(id: params[:user_id])
	end


end
