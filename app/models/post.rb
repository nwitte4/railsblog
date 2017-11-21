class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 3 }
end
