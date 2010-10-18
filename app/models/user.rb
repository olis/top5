class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :database_authenticatable, :registerable, :recoverable, :validatable and :timeoutable
  devise :omniauthable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
end
