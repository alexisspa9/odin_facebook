class FriendRequestsController < ApplicationController
  include FriendRequestsHelper

  def create
  	new_friend_request(params[:requestee])
  	redirect_to root_path
  end


  def destroy
  	if (request = current_user.sent_requests.find_by_id(params[:id]) || request = current_user.received_requests.find_by_id(params[:id]) )
  	request.destroy
  	flash[:notice] = "Friend request cancelled"
  	redirect_to root_path
  	else
  	flash[:notice] = "Friend couldn't be found"
  	redirect_to root_path
  	end
  end
end
