class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
  validates :username, presence: true # username and password must be filled out
  validates :username, uniqueness: true # username is always unique
  validates :username, length: {in: 3..18} # username is between 3 and 18 digits
  validates :password, presence: true, length: {minimum: 5, maximum: 20}, on: :create
  validates :password, length: {minimum: 5, maximum: 20}, on: :update, allow_blank: true
end
