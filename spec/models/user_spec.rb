require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
	@myuser = User.new(email: "user@example.com", name: "Alexander", password: "babacha1234", password_confirmation: "babacha1234")
	@anotheruser = User.new(email: "test@example.com", name: "John", password: "babacha1234", password_confirmation: "babacha1234")
	end

	it "should be valid" do
		@myuser.valid?
	end

end
