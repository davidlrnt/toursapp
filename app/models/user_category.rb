class UserCategory < ActiveRecord::Base
  belongs_to :traveler, class_name: "User"
  belongs_to :category
end
