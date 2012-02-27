class User < ActiveRecord::Base
  # This sets up the common user/admin relations (post, votes),
  # validations, and methods
  include Newsful::UserBehavior

  has_many :comments, :as => :author

  validates_presence_of :email

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable
end
