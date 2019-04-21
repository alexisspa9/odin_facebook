class CommentsController < ApplicationController
	include NotificationsHelper
	before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.new comment_params
      @comment.author = current_user
      if @comment.save
      		flash[:success] = "Your comment was successfully create!"
			redirect_back(fallback_location: root_path)
      else
      		flash[:alert] = "Something went wrong!"
			redirect_back(fallback_location: root_path)
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Pic.find_by_id(params[:comment][:pic_id]) if params[:comment][:pic_id]
      @commentable = Post.find_by_id(params[:comment][:post_id]) if params[:comment][:post_id]
    end
end