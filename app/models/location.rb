class Location < ActiveRecord::Base
	has_many :location_tours
	has_many :tours, through: :location_tours
	has_many :comments
end
