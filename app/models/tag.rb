class Tag < ActiveRecord::Base
	has_many :category_tags
	has_many :categories, through: :category_tags
	has_many :tag_tours
	has_many :tours, through: :tag_tours

	validates :name, uniqueness: true

end
