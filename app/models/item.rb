class Item < ActiveRecord::Base
  belongs_to :toplist
  
  validates_presence_of :title
  validates_presence_of :toplist_id
  validates_presence_of :position
  validates_uniqueness_of :title, :scope => :toplist_id
  
  default_scope :order => :position
end