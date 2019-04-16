module FriendRequestsHelper

  def new_friend_request(requestee)
    dub = FriendRequest.find_by(requestee_id:  current_user.id, requestor_id: requestee)
    unless dub
      request = current_user.sent_requests.build(requestee_id: requestee)
      if request.save
        flash[:notice] = 'Friend request sent!'
      else
        flash[:alert] = "Friend request couldn't be sent:#{request.errors.full_messages}"
      end
    else 
      flash[:alert] = "Friend request couldn't be sent"
    end
  end
end