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

    it "rejects duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr.merge(:username => "nonduplicateusername"))
      user_with_duplicate_email.should_not be_valid
    end

    it "rejects duplicate case insensitive email addresses" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email, :username => "nonduplicateusername"))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end

    it "rejects duplicate usernames" do
      User.create!(@attr)
      user_with_duplicate_username = User.new(@attr.merge(:email => "nonduplicate@email.com"))
      user_with_duplicate_username.should_not be_valid
    end
  end
end
