class PostsController < ApplicationController
	before_action :verify_user, only: [:edit, :update, :destroy]

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Your post was successfully create!"
			redirect_back(fallback_location: root_path)
		else
			flash[:alert] = "Something went wrong!"
			redirect_back(fallback_location: root_path)
		end
	end

	def edit
	end


	def update
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:user_id, :body)
	end

	def verify_user
		return
	end
end