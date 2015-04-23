class Audio < ActiveRecord::Base
  belongs_to :location
  belongs_to :tour
  belongs_to :participant, class_name: "User"
  belongs_to :guide, class_name: "User"
end
