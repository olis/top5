class ToplistsController < ApplicationController
  
  def index
    @toplists = Toplist.all
  end
  
end