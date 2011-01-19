class Topic < ActiveRecord::Base
  belongs_to :category
  has_many :toplists, :dependent => :destroy
end