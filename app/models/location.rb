class Location < ActiveRecord::Base
	has_many :location_tours
	has_many :tours, through: :location_tours
	has_many :comments
	has_many :location_travelers
	has_many :travelers, through: :location_travelers, class_name: "User"
	belongs_to :guide, class_name: "User"
	validates :title, presence: true

  def get_coordinates
    zipcode_uri = 'http://maps.googleapis.com/maps/api/geocode/json?'
    api_response = HTTParty.get(zipcode_uri, :query => {:address => self.address})["results"][0]["geometry"]["location"]
  end
end
