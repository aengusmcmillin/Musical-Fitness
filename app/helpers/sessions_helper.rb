module SessionsHelper

  def sign_in(user, remember)
    if remember == 1
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token( cookies[:auth_token] ) if cookies[:auth_token]
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:auth_token)
  end
end
