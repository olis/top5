class ToplistsController < ApplicationController
  
  def index
    @toplists = Toplist.all
  end
  
  def new
    @toplist = Toplist.new
  end
  
end