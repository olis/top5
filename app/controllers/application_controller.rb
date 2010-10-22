class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def signed_in?
    !!current_user # == current_user?
  end
  
  helper_method :current_user, :signed_in?
  
  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def require_user
    session[:return_to] = request.url
    redirect_to '/auth/twitter' unless signed_in?
  end
  
  def redirect_back_or_default(default)
    return_to = session[:return_to]
    session[:return_to] = nil
    if return_to
      redirect_to(return_to)
    else
      redirect_to(default)
    end
  end
end
