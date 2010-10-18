class ToplistsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new]
  
  def index
    @toplists = Toplist.all
  end
  
  def new
    @toplist = Toplist.new
  end
  
end