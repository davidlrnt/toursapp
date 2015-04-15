class User < ActiveRecord::Base
  has_secure_password
  has_many :category_users
  has_many :categories, through: :category_users
  has_many :comments
  has_many :reviews

  validates :email, presence: true, uniqueness: true
end
