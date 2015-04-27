class Category < ActiveRecord::Base
	has_many :user_categories
  has_many :tours
	has_many :category_tags
	has_many :tags, through: :category_tags
end
