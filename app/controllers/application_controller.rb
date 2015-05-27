class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
  rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:user_id] = nil
      session[:access_token] = nil
      redirect_to root_url, alert: "Access token expired, try signing in again."
    end
  end

private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new("7a0b5cbb8794178111f5cfc4fc5687238dc9690de95e6365126bff516bcdbc43", "e645f0173b5c0580994ee1e424a22ba93532ef0147a1c89616bfb08501392cd8", site: "http://localhost:3000")
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
 

end
