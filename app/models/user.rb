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

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :notifications
  has_many :posts
  has_many :pics
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :nullify



	def after_confirmation
	  UserMailer.welcome_email(self).deliver
	end

  def friend_requests
    FriendRequest.where(requestee_id: id).includes(:requestor)
  end

  def not_friends
    User.all.where('id <> :user AND
      id NOT IN (SELECT friend_id FROM friendships WHERE user_id = :user)',
      user: id)
  end

  def is_friend(friend)
    Friendship.find_by(friend_id: friend.id, user_id: id) || Friendship.find_by(friend_id: id, user_id: friend.id)
  end


  def is_sent_request(friend)
      self.sent_requests.find_by(requestee_id: friend.id)
  end

  def is_received_request(friend)
     self.received_requests.find_by(requestor_id: friend.id)
  end

  def is_liked?(post)
    self.likes.find_by(likeable_id: post.id, likeable_type: post.class.name)
  end

  def unread_notifications
    self.notifications.where(is_read: false)
  end

  def user_feed
    @posts =  Post.where("user_id = :user_id", user_id: id).includes(:likes, :comments)
    @pics = Pic.where("user_id = :user_id", user_id: id).includes(:likes, :comments)
    @combined = @posts + @pics
    @combined.sort_by { |h| h[:created_at] }.reverse!
  end

  def feed
    friend_ids = "SELECT user_id FROM friendships
                     WHERE  friend_id = :user_id"
    
    @posts =  Post.where("user_id IN (#{friend_ids})
                     OR user_id = :user_id", user_id: id).includes(:likes, :comments)
    @pics = Pic.where("user_id IN (#{friend_ids})
                     OR user_id = :user_id", user_id: id).includes(:likes, :comments)
    @combined = @posts + @pics
    @combined.sort_by { |h| h[:created_at] }.reverse!

  end

end
