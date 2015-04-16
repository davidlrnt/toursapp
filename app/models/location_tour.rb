class LocationTour < ActiveRecord::Base
  belongs_to :tour
  belongs_to :location
end
