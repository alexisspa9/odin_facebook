require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
	@myuser = User.new(email: "user@example.com", name: "Alexander", password: "babacha1234", password_confirmation: "babacha1234")
	end

	it "should be valid" do
		@myuser.valid?
	end

	it "validates name presence" do
		@myuser.name = " "
		expect(@myuser).to_not be_valid
	end

	it "email should be unique " do
		@myuser.skip_confirmation!
		@myuser.save
		u = User.new(email: "USER@example.com", name: "George", password: "babacha1234", password_confirmation: "babacha1234")
		expect(u).to_not be_valid
    	expect(u.errors[:email]).to include("has already been taken")
	end


	it "should have many sent requests" do
		t = User.reflect_on_association(:sent_requests)
		expect(t.macro).to eq(:has_many)
	end


	it "should have many received requests" do
		t = User.reflect_on_association(:received_requests)
		expect(t.macro).to eq(:has_many)
	end


	it "should have many friends" do
		t = User.reflect_on_association(:friends)
		expect(t.macro).to eq(:has_many)
	end

	it "can have a received request" do
		@myuser.received_requests.build(requestor_id:3)
		expect(@myuser.received_requests.size).to eq(1)
	end

	it "can send a friend request" do
		@myuser.sent_requests.build(requestee_id:3)
		expect(@myuser.sent_requests.size).to eq(1)
	end

	it "can have a friend" do
		@myuser.friendships.build(friend_id:3)
		expect(@myuser.friendships.size).to eq(1)
	end

	
end
