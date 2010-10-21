class ToplistsController < ApplicationController
  
  def index
    @toplists = Toplist.all
  end
  
  def new
    @toplist = Toplist.new
    @toplist.build_items
  end
  
  def create
    @toplist = Toplist.new(params[:toplist])
    
    if @toplist.save
      redirect_to toplists_path
      #redirect_to user_toplists_path(current_user)
    else
      render :new
    end
  end
  
end