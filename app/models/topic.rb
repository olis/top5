class Topic < ActiveRecord::Base
  has_many :toplists, :dependent => :destroy
end