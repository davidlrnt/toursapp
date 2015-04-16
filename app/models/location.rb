class Location < ActiveRecord::Base
	has_many :location_tours
	has_many :tours, through: :location_tour
	has_many :comments
	belongs_to :guide, class_name: "User"
end
