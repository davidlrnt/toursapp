class Comment < ActiveRecord::Base
  belongs_to :user, class_name: "Guide"
  belongs_to :user, class_name: "Traveler"
  belongs_to :location
  
  validates :name, :content, presence: true
end
