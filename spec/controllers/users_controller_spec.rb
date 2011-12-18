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
  end

  describe "GET 'new'" do

  end

end
