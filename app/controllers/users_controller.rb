class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.username
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Musical Fitness!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

end
