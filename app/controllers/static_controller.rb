class StaticController < ApplicationController
  def home
  	@users = User.where.not(id: current_user.id).limit(5)
  	@friend_requests = FriendRequest.where(requestee_id: current_user.id).includes(:requestor)
  end
end
