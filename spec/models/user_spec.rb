require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :username => "ExampleUsername", :email => "user@example.com", :password => "randompass123" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  describe 'validation' do
    it "requires a username" do
      no_username_user = User.new(@attr.merge(:username => ""))
      no_username_user.should_not be_valid
    end

    it "requires an email" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "requires a password" do
      no_password_user = User.new(@attr.merge(:password => ""))
      no_password_user.should_not be_valid
    end

    it "rejects usernames that are too short" do
      short_username = "a"*5;
      short_username_user = User.new(@attr.merge(:username => short_username))
      short_username_user.should_not be_valid
    end

    it "rejects usernames that are too long" do
      long_username = "a"*21;
      long_username_user = User.new(@attr.merge(:username => long_username))
      long_username_user.should_not be_valid
    end

    it "accepts valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "rejects invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end
  end
end
