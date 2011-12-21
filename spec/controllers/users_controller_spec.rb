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
      response.should render_template("show")
    end

    it "has the correct title" do
      assigns(:title).should == @user.username
    end
  end

  describe "#new" do
    it "displays the signup page" do
      get :new
      response.should render_template("new")
    end

    it "has the correct title" do
      get :new
      assigns(:title).should == "Sign Up"
    end
  end

  describe '#create' do
    context 'success' do
      before :each do
        @attr = { :username => "New User", :email => "Example@example.com", :password => "password", :password_confirmation => "password" }
      end

      it 'creates a user' do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it 'redirects to the user show page' do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it 'displays a welcome message' do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to musical fitness/i
      end
    end

    context 'failure' do
      before :each do
        @attr = { :username => "", :email => "", :password => "", :password_confirmation => "" }
      end

      it 'does not create a user' do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it 'has the correct title' do
        post :create, :user => @attr
        assigns(:title).should == "Sign Up"
      end

      it 'reloads the signup page' do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
  end
end
