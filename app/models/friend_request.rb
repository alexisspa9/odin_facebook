class FriendRequest < ApplicationRecord
  belongs_to :requestor, class_name: 'User', foreign_key: 'requestor_id'
  belongs_to :requestee, class_name: 'User', foreign_key: 'requestee_id'

  validates :requestor, uniqueness: { scope: :requestee}

end
