class Tour < ActiveRecord::Base
  belongs_to :category
  belongs_to :guide, class_name: "User"
  has_many :city_tours
  has_many :cities, through: :city_tours
  has_many :location_tours
  has_many :locations, through: :location_tours, dependent: :destroy
  has_many :comments
  has_many :reviews
  has_many :tag_tours
  has_many :tags, through: :tag_tours
  has_many :participant_tours
  has_many :participants, through: :participant_tours
  has_many :images
  has_many :audios
  has_many :videos

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :cities, reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :comments, reject_if: lambda {|attributes| attributes['content'].blank?}

  validates :title, :description, presence: true


  def participate(user)
    self.participants << user
  end

  def quit(user)
    self.participants.delete(user)

  end

  def progress(user)
    x = 0
    locations.each do |location|
      if user.checked_in_locations.include?(location)
        x += 1
      end
    end
    if x == locations.count
    user.participant_tours.find_by(self.id).update(completed: true)
    completed(user)
    end
    x.to_f/locations.count.to_f
  end

  def completed(user)
    participant_tours.where(completed = true)
  end

  def get_directions
    # binding.pry
  end

  def set_average
    update(average_score: reviews.sum(:rating).to_f/reviews.count.to_f)
  end
end
