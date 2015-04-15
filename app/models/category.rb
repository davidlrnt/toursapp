class Category < ActiveRecord::Base
	has_many :category_users
	has_many :users, through: :category_users
	has_many :tours
	has_many :category_tags
	has_many :tags, through: :category_tags
end
