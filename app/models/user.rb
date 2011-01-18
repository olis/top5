class User < ActiveRecord::Base
  has_many :authorizations
  has_many :toplists, :dependent => :destroy
  
  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :image => hash['user_info']['image'])
  end
end
