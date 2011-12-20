class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    user = User.find_by_username(params[:session][:username])
    authenticated = false
    if user
      authenticated = user.authenticate(params[:session][:password])
    end
    if authenticated
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Signed In!"
    else
      flash.now[:error] = "Invalid username/password combination"
      @title = "Sign In"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed Out!"
  end
end
