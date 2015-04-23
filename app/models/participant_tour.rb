class ParticipantTour < ActiveRecord::Base
	belongs_to :participant, class_name: "User", dependent: :destroy
	belongs_to :tour

end
