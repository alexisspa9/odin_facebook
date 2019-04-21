class PicsController < ApplicationController
	before_action :verify_user, only: [:edit, :update, :destroy]

	def create
		@pic = current_user.pics.build(pic_params)
		if @pic.save
			flash[:success] = "Your picture was successfully uploaded!"
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

	def pic_params
		params.require(:pic).permit(:user_id, :image)
	end

	def verify_user
		return
	end
end