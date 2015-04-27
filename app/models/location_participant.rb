class LocationParticipant < ActiveRecord::Base
	belongs_to :participant, class_name: "User"
	belongs_to :location

end
