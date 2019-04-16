module NotificationsHelper

   def new_notification(message, user)
      user.notifications.create(body: message, is_read: false)
   end

end