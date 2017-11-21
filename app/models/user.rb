class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password
  validates :username, :password, presence: true # username and password must be filled out
  validates :username, uniqueness: true # username is always unique
  validates :password, length: {in: 6..20} # password is between 6 and 20 digits
  validates :username, length: {in: 3..18} # username is between 3 and 18 digits
end
