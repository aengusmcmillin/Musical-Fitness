class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if !params[:session][:remember_me]
        cookies[:auth_token] = user.auth_token
      else
        cookies.permanent[:auth_token] = user.auth_token
      end
      redirect_to root_path, :notice => "Signed In!"
    else
      flash.now[:error] = "Invalid username/password combination"
      @title = "Sign In"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Signed Out!"
  end
end
