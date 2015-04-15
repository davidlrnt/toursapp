class User < ActiveRecord::Base
  has_many :category_users
  has_many :categories, through: :category_users
  has_many :comments
  has_many :reviews

  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
