class City < ActiveRecord::Base
  belongs_to :country
  has_many :city_tours
  has_many :tours, through: :city_tours
  has_many :images

end
