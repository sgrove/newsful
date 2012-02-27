class Admin < ActiveRecord::Base
  # This sets up the common user/admin relations (post, votes),
  # validations, and methods
  include Newsful::UserBehavior

  has_many :comments, :as => :author

  validates_presence_of :ido_id

  devise :bushido_authenticatable

  def bushido_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
    self.locale     = extra_attributes["locale"]
    self.timezone   = extra_attributes["timezone"]
  end
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :ido_id, :first_name, :last_name
end
