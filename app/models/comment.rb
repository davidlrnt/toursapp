class Comment < ActiveRecord::Base
  belongs_to :guide, class_name: "User"
  belongs_to :participant, class_name: "User"
  belongs_to :location
  belongs_to :tour

  validates  :content, presence: true
end
