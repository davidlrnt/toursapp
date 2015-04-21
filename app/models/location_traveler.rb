class LocationTraveler < ActiveRecord::Base
	belongs_to :traveler, class_name: "User"
	belongs_to :location

end
