module Newsful
  module Bushido
    def self.enable_bushido!
      self.load_hooks!
      self.extend_admin!
      self.disable_devise_for_bushido_controllers!
    end

    def self.extend_admin!
      puts "Extending the user model"
      Admin.instance_eval do
        include ::Bushido::UserHelper

        validates_presence_of   :ido_id
        validates_uniqueness_of :ido_id

        attr_accessible :ido_id
      end

      Admin.class_eval do
        def bushido_extra_attributes(extra_attributes)
          self.first_name   = extra_attributes["first_name"]
          self.last_name    = extra_attributes["last_name"]
          self.locale       = extra_attributes["locale"]
          self.email        = extra_attributes["email"]
          self.username   ||= extra_attributes["email"].split("@").first
        end
      end
    end
    
    def self.load_hooks!
      Dir["#{Dir.pwd}/lib/bushido/**/*.rb"].each { |file| require file }
    end

    def self.disable_devise_for_bushido_controllers!
      puts "Disabling devise auth protection on bushido controllers"

      ::Bushido::DataController.instance_eval { before_filter :authenticate_user!, :except => [:index]  }
      ::Bushido::EnvsController.instance_eval { before_filter :authenticate_user!, :except => [:update] }
      ::Bushido::MailController.instance_eval { before_filter :authenticate_user!, :except => [:index]  }

      puts "Devise checks disabled for Bushido controllers"
    end
  end
end


if Bushido::Platform.on_bushido?
  class BushidoRailtie < Rails::Railtie
    config.to_prepare do
      puts "Enabling Bushido"
      Newsful::Bushido.enable_bushido!
      puts "Finished enabling Bushido"
    end
  end
end
