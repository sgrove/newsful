module Newsful
  module UserBehavior
    def self.included(mod)
      mod.instance_eval do
        puts "Extending #{mod} with Newsful::UserBehavior"
        has_many :posts, :as => :owner
        has_many :votes, :as => :voter

        validates_presence_of :first_name
        validates_presence_of :last_name

        before_validation Proc.new { |user| user.points ||= 1 }
      end
    end

    def to_s
      "#{first_name} #{last_name}"
    end
  end
end
