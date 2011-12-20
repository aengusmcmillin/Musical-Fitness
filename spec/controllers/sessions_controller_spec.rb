require 'spec_helper'

describe SessionsController do

  describe "#new" do
    it "returns http success" do
      get :new
      response.should be_success
    end

    it "shows the sign in page" do
      get :new
      response.should render_template("new")
    end

    it "has the correct title" do
      get :new
      assigns(:title).should == "Sign In"
    end
  end

  describe "#create" do
    context "invalid signin" do
      before :each do
        @attr = { :email => "email@example.com", :password => "invalid" }
        post :create, :session => @attr
      end
      it "re-renders the 'new' page" do
        response.should render_template('new')
      end

      it "has the correct title" do
        assigns(:title).should == "Sign In"
      end

      it "has a flash.now message" do
        flash.now[:error].should =~ /invalid/i
      end
    end

    context "valid signin" do
      before :each do
        @user = FactoryGirl.create(:user)
        @attr = { :username => @user.username, :password => @user.password }
        post :create, :session => @attr
      end

      it "signs in the user" do
        session[:user_id].should == @user.id
      end

      it "redirects to the home page" do
        response.should redirect_to(root_path)
      end
    end
  end

end
