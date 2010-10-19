class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate_using_twitter
    redirect_to user_omniauth_authorize_path(:twitter) unless user_signed_in?
  end
end
