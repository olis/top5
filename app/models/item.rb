class Item < ActiveRecord::Base
  belongs_to :toplist
  
  validates_presence_of :title
  validates_presence_of :position
  
  default_scope :order => :position
end