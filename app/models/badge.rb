class Badge < ActiveRecord::Base
	has_many :badge_users
	has_many :users, through: :badge_users

	def self.find_badge(badge_type)
		badges = Badge.where(badge_type: badge_type)
	end

end
