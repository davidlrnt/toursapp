class Comment < ActiveRecord::Base
  belongs_to :guide, class_name: "User"
  belongs_to :traveler, class_name: "User"
  belongs_to :location

  validates :name, :content, presence: true
end
