class Category < ActiveRecord::Base
  has_many :topics
  
  validates_presence_of :title
  
  named_scope :ordered, :order => 'position'
end