class User < ApplicationRecord

  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

   has_many :sent_requests, class_name: 'FriendRequest', foreign_key: 'requestor_id', dependent: :destroy
   has_many :received_requests, class_name: 'FriendRequest', foreign_key: 'requestee_id', dependent: :destroy


	def after_confirmation
	  UserMailer.welcome_email(self).deliver
	end

  def sent_requests
    User.joins(:received_requests).merge(FriendRequest.where(:requestor_id => id))
  end
end
