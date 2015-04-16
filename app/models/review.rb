class Review < ActiveRecord::Base
  belongs_to :traveler, class_name: "User"
  belongs_to :tour
end
