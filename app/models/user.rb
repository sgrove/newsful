class User < ActiveRecord::Base
  # This sets up the common user/admin relations (post, votes),
  # validations, and methods
  include Newsful::UserBehavior

  has_many :comments, :as => :author

  validates_presence_of :username
  validates_presence_of :email

  attr_accessor   :login
  attr_accessible :username

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  before_validation Proc.new { |user| user.password_confirmation ||= user.password if user.respond_to?(:password_confirmation) }

  # To allow sign-in with either username or email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
  end
end
