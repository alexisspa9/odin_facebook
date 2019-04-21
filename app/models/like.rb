class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :likeable, polymorphic: true
  validates :user, uniqueness: { scope: :likeable}
end
