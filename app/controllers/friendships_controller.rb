class FriendshipsController < ApplicationController
	include FriendRequestsHelper

	def create
		friend = User.find(params[:friend_id])
		if request = FriendRequest.find_by(requestor_id: friend.id, requestee_id: current_user.id)
			friendship = current_user.friendships.build(friend_id: friend.id)
			if friendship.save
				flash[:success] = "Congratulations you are now friends with #{friend.name}"
				request.destroy
				redirect_to root_path
			else
				flash[:error] = "Something went wrong"
				redirect_to root_path
			end
		else
			flash[:notice] = "Sent request has been sent to #{friend.name}"
			new_friend_request(friend.id)
			redirect_to root_path
		end
	end


	def destroy
		if friendship = current_user.friendships.find(params[:id])
			friendship.destroy
			flash[:warning] = "Friend has been removed"
			redirect_to root_path
		else
			flash[:warning] = "Can't find friend"
			redirect_to root_path
		end
	end

end