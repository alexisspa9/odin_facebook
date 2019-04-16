class User < ApplicationRecord

  validates :email, uniqueness: true
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

has_many :sent_requests, class_name: 'FriendRequest',
    foreign_key: 'requestor_id', dependent: :destroy
  has_many :received_requests, class_name: 'FriendRequest',
    foreign_key: 'requestee_id', dependent: :destroy

  has_many :friends, through: :friendships, class_name: 'User'
  has_many :friendships, dependent: :destroy


	def after_confirmation
	  UserMailer.welcome_email(self).deliver
	end

  def friend_requests
    FriendRequest.where(requestee_id: id).includes(:requestor)
  end

  # def not_friends
  #   User.where()
  # end
end
