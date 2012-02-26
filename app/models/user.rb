class User < ActiveRecord::Base
  has_many :posts, :as => :owner
  has_many :votes, :as => :voter
  has_many :comments, :as => :author

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  before_validation Proc.new { |user| user.points ||= 1 }

  def to_s
    "#{first_name} #{last_name}"
  end
end
