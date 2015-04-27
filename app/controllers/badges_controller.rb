class BadgesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:index]
	def index
		@user.get_badge("participant")
	end

private

	def set_user
		@user = User.find_by(id: params[:user_id])
	end


end
