require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) { @myuser = User.new(email: "user@example.com", password: "babacha1234", password_confirmation: "babacha1234")}

	it "should be valid" do
		@myuser.valid?
	end

	it "user should have a name" do
		@myuser.fullname = "Alexander"
		@myuser.valid?
	end


end
