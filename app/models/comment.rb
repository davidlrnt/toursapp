class Comment < ActiveRecord::Base
  belongs_to :guide, class_name: "User"
  belongs_to :participant, class_name: "User"
  belongs_to :location
  belongs_to :tour
  has_many :images
  has_many :videos
  has_many :audios
  validates  :content, presence: true
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, AudioUploader
end
