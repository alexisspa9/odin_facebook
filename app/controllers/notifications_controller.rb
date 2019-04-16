class NotificationsController < ApplicationController
   

   def make_read
    n = current_user.notifications.find(params[:id])
    n.is_read = true
    n.save
    redirect_back(fallback_location: root_path)
   end


end