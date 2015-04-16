class Tour < ActiveRecord::Base
  belongs_to :category
  belongs_to :traveler, through: :categories, class_name: "User"
  belongs_to :guide, through: :categories, class_name: "User"
  has_many :city_tours
  has_many :cities, through: :city_tours
  has_many :location_tours
  has_many :locations, through: :location_tour
  has_many :reviews
  has_many :tag_tours
  has_many :tags, through: :tag_tours

  validates :title, :description, presence: true
end
