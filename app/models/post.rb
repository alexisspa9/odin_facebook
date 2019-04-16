class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 5, maximum: 500}
end
