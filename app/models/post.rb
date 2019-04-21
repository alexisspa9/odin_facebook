class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :body, presence: true, length: { minimum: 5, maximum: 500}
  default_scope { order(created_at: :desc) }
end
