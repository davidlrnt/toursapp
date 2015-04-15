class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  
  validates :name, :content, presence: true
end
