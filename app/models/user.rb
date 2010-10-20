class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :omniauthable, :rememberable, :trackable, :registerable, :recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"]
        user.email = data["email"]
      end
    end
  end
  
  def self.find_or_create_for_twitter_oauth(data)
    debugger
    user = where(:twitter_uid => data['uid']).first
    user ||= User.create(:email => data['email'], :twitter_uid => data['uid'])
    user
  end
end
