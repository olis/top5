class Item < ActiveRecord::Base
  belongs_to :toplist
  
  validates_uniqueness_of :title, :scope => :toplist_id
  
  default_scope :order => :position
end