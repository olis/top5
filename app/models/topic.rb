class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :toplists, :dependent => :destroy
  
  named_scope :ordered_by_activity, :order => 'toplists_count DESC'
end