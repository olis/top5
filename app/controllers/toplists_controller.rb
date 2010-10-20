class ToplistsController < ApplicationController
  before_filter :authenticate_using_twitter, :only => [:new]
  
  def index
    @toplists = Toplist.all
  end
  
  def new
    @toplist = Toplist.new
  end
  
end