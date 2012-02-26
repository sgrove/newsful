class Admin < ActiveRecord::Base
  has_many :posts, :as => :owner
  has_many :votes, :as => :voter

  validates_presence_of :ido_id

  def bushido_extra_attributes(extra_attributes)
    self.first_name = extra_attributes["first_name"].to_s
    self.last_name  = extra_attributes["last_name"].to_s
    self.email      = extra_attributes["email"]
    self.locale     = extra_attributes["locale"]
    self.timezone   = extra_attributes["timezone"]
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :bushido_authenticatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :ido_id, :first_name, :last_name
end
