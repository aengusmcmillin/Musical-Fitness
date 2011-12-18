require 'spec_helper'

describe UsersController do

  describe "#show" do
    before :each do
      @user = FactoryGirl.create(:user)
      get :show, :id => @user
    end

    it "finds the user" do
      assigns(:user).should == @user
    end

    it "displays the users profile" do
      response.should render_template("users/show")
    end

    it "has the correct title" do
      assigns(:title).should == @user.username
    end
  end

  describe "#new" do
    it "displays the signup page" do
      get :new
      response.should render_template("users/new")
    end

    it "has the correct title" do
      get :new
      assigns(:title).should == "Sign Up"
    end
  end

  describe '#create' do

  end
end
