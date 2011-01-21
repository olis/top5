class Category < ActiveRecord::Base
  has_many :topics
  has_many :toplists, :through => :topics
  
  validates_presence_of :title
  
  named_scope :ordered, :order => :position
end