class TravelerComment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :traveler, class_name: "User"
end
