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
      		flash[:success] = "You liked the post!"
			redirect_back(fallback_location: root_path)
      else
      		flash[:alert] = "Something went wrong!"
			redirect_back(fallback_location: root_path)
      end
    end

    private

    def find_likeable
      @likeable = Pic.find_by_id(params[:pic_id]) if params[:pic_id]
      @likeable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end