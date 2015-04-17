class Tag < ActiveRecord::Base
  belongs_to :traveler, class_name: "User"
	has_many :category_tags
	has_many :categories, through: :category_tags
	has_many :tag_tours
	has_many :tours, through: :tag_tours

  validates_uniqueness_of :name

end
