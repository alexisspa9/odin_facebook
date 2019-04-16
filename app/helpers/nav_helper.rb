module NavHelper
	def notifications_dropdown
		unless current_user.unread_notifications.empty?
          'layouts/nav_partials/notifications_dropdown'
        else
          'layouts/nav_partials/no_notifications'
        end
	end


	def friend_requests_dropdown
		unless current_user.friend_requests.empty?
            'layouts/nav_partials/friend_requests_dropdown'
        else
        	'layouts/nav_partials/no_friend_requests'
        end
	end
end