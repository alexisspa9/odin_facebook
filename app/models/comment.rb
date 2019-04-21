class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :commentable, polymorphic: true, counter_cache: true


  validates :body, length: {in: 1..255}, format: {without: /\A\s+\z/,
    message:"can't be blank"}
    default_scope  { order(created_at: :desc) }
end
