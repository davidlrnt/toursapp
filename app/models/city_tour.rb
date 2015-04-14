class CityTour < ActiveRecord::Base
  belongs_to :city
  belongs_to :tour
end
