require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
  	@user = User.new(email: "user@example.com", name: "Alexander", password: "babacha1234", password_confirmation: "babacha1234")
   @post = @user.posts.build(body: "this is a test post")
  end


  it "User can create a post" do
  	expect(@post).to be_valid
  end

  it "should validate body presence" do
  	@post.body = " "
  	expect(@post).to_not be_valid
  end

  it "should validate body length minimum 5" do
  	@post.body = "1234"
  	expect(@post).to_not be_valid
  end


  it "should validate body length maximum 500" do
  	 @post.body = "a" * 501
  	expect(@post).to_not be_valid
  end


end
