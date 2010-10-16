class Item < ActiveRecord::Base
  belongs_to :toplist
  
  default_scope :order => :position
end