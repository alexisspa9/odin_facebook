class LikesController < ApplicationController
	include NotificationsHelper
	before_action :find_likeable

    def new
      @like = Like.new
    end

    def create
      @like = @likeable.likes.new
      @like.user = current_user
      if @like.save
      	    new_notification("#{current_user.name} liked your post!", @likeable.user_id)
      		flash[:success] = "You liked the post!"
			redirect_back(fallback_location: root_path)
      else
      		flash[:alert] = "Something went wrong!"
			redirect_back(fallback_location: root_path)
      end
    end

    private

    def find_likeable
      # @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @likeable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end