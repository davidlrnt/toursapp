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
end
