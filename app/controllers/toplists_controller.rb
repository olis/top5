class ToplistsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  before_filter :find_parent
  
  def index
    @toplists = @parent ? @parent.toplists : Toplist.ordered
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
  
protected

  def find_parent
    @parent = Category.find(params[:category_id]) if params[:category_id]
    @parent = Topic.find(params[:topic_id]) if params[:topic_id]
  end
  
end