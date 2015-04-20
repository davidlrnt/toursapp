class User < ActiveRecord::Base
  has_many :tours, foreign_key: "guide_id", dependent: :destroy
  has_many :categories, through: :category_users
  has_many :category_tags, through: :categories
  has_many :tags, through: :category_tags
  has_many :locations, through: :tours, foreign_key: "guide_id"
  has_many :comments, through: :tours, foreign_key: "guide_id"

  has_many :participant_tours, foreign_key: "participant_id"
  has_many :trips, through: :participant_tours, source: :participant
  has_many :trips, through: :participant_tours, source: :tour
  has_many :comments, foreign_key: "participant_id"
  has_many :reviews, through: :tours, foreign_key: "participant_id"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]


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

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end

end
