class SessionsController < ApplicationController
  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user
    
    notice = "Welcome, #{current_user.name}."
    redirect_back_or_default root_path
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
