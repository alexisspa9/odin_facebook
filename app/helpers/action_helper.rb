module ActionHelper

	def render_actions
		unless current_user.id == @user.id
			if current_user.is_friend(@user)
				'actions/remove_friend'
			elsif current_user.is_sent_request(@user)
				'actions/cancel_friend_request'
	        elsif current_user.is_received_request(@user)
	        	'actions/accept_deny_friend_request'
	        else
		        'actions/send_friend_request'
	         end
	    else
	    	'actions/edit_your_profile'
	    end
		
	end

end