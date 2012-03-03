module Newsful
  module UserBehavior
    def self.included(mod)
      mod.instance_eval do
        puts "Extending #{mod} with Newsful::UserBehavior"
        has_many :posts, :as => :owner
        has_many :votes, :as => :voter

        # If you want more complete user profiles
        # validates_presence_of :first_name
        # validates_presence_of :last_name

        attr_accessible :email, :password

        before_validation Proc.new { |user| user.points ||= 1 }        
      end
    end

    def to_s
      return "#{first_name} #{last_name}" unless first_name.nil?
      return username
    end
  end
end
