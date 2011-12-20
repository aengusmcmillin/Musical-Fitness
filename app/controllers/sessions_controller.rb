class SessionsController < ApplicationController
  def new
    @title = "Sign In"
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])

    else
      flash.now[:error] = "Invalid username/password combination"
      @title = "Sign In"
      render 'new'
    end
  end

end
