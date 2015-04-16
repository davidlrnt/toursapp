class CategoryTag < ActiveRecord::Base
  #subcategory
  belongs_to :tag
  belongs_to :category
end
