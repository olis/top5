class ToplistsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  
  def index
    @toplists = Toplist.ordered
  end
  
  def new
    @toplist = Toplist.new
    @toplist.build_items
  end
  
  def create
    @toplist = Toplist.new(params[:toplist])
    @toplist.user = current_user
    
    if @toplist.save
      redirect_to toplists_path
      #redirect_to user_toplists_path(current_user)
    else
      render :new
    end
  end
  
end