require 'rails_helper'

RSpec.describe StaticController, type: :controller do

	before(:each) do
		@u = User.new(email: "user@example.com", name: "Alexander", password: "babacha1234", password_confirmation: "babacha1234")
	end

	  it "should redirect to login page if not logged in" do
		get :home
      	expect(response).to redirect_to new_user_session_path
	  end

	  it "should redirect to home page if logged in" do
	  	@u.confirm
	  	sign_in @u
		get :home
      	expect(response).to render_template(:home)
	  end
  

end
