class Admin < ActiveRecord::Base
  # This sets up the common user/admin relations (post, votes),
  # validations, and methods
  include Newsful::UserBehavior

  has_many :comments, :as => :author

  attr_accessor   :login

  # Loads the correct devise modules as determined in
  # ./config/initializers/newsful.rb
  devise *Newsful.admin_devise_modules

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name
end
