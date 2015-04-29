class User < ActiveRecord::Base
  has_many :tours, foreign_key: "guide_id", dependent: :destroy
  has_many :categories, through: :category_users
  has_many :category_tags, through: :categories
  has_many :tags, through: :category_tags
  has_many :locations, through: :tours
  has_many :guide_comments
  has_many :comments, through: :guide_comments, foreign_key: "guide_id"

  has_many :guideratings, foreign_key: "guide_id"

  has_many :images, foreign_key: "guide_id"
  has_many :images, foreign_key: "participant_id"


  has_many :audios, foreign_key: "guide_id"
  has_many :audios, foreign_key: "participant_id"

  has_many :videos, foreign_key: "guide_id"
  has_many :videos, foreign_key: "participant_id"

  has_many :participant_tours, foreign_key: "participant_id"
  has_many :trips, through: :participant_tours, source: :tour
  has_many :location_participants, foreign_key: "participant_id"
  has_many :places, through: :location_participants, source: :location
  has_many :reviews, through: :tours, foreign_key: "participant_id"

  has_many :participant_locations, foreign_key: "participant_id"
  has_many :checked_in_locations, through: :participant_locations, source: :location, foreign_key: "participant_id"

  has_many :badge_users
  has_many :badges, through: :badge_users

    has_many :friendships
    has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

    has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
    has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
    has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
    has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user





  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]


  acts_as_messageable

  def friends
    active_friends | passive_friends
  end


  def mailboxer_name
   self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def checkin_static(location)
    checked_in_locations << location
  end

  def checkin(location, coords)
    if location.lat.to_f.round(2) == coords["latitude"].to_f.round(2) && location.lng.to_f.round(2) == coords["longitude"].to_f.round(2)
    checked_in_locations << location
    else
      "wrong location"
    end
  end

  def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         user.provider ||= auth.provider
         user.uid = auth.uid
         user.email = auth.info.email
         user.name = auth.extra.raw_info.first_name + " " + auth.extra.raw_info.last_name
         user.gender = auth.extra.raw_info.gender
         user.password = Devise.friendly_token[0,20]
    end
  end

  def get_badge
    badges_keys = ["guide", "review", "participant"]
    badges_keys.each do |badge|
      counter = set_count(badge)
      if counter <= 5 && counter > 0
        @badges = Badge.find_badge(badge)
        @badges.each do |badge|
          self.badges << badge if badge.requirement <= counter && !self.badges.include?(badge)
        end
      end
    end
  end


  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
      end
    end
  end

  def set_average
    update(average_score: (guideratings.sum(:rating).to_f/guideratings.all.count.to_f).round(2) )
  end

  def set_count(badge_type)
    if badge_type == "guide"
      return counter = self.tours.count
    elsif badge_type == "review"
      return counter = Review.where(participant_id: self.id).count
    elsif badge_type == "participant"
      return counter = self.participant_tours.where(completed: true).count
    end
  end

end
