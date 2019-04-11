require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) { @myuser = User.new(email: "user@example.com", name: "Alexander", password: "babacha1234", password_confirmation: "babacha1234")}

	it "should be valid" do
		@myuser.valid?
	end

	


end
