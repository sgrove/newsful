require './lib/newsful/user_behavior'

module Newsful
  def self.admin_devise_modules

    standard = [:database_authenticatable, :registerable, :confirmable,
                :recoverable, :rememberable, :trackable, :validatable]

    bushido = [:bushido_authenticatable, :trackable, :token_authenticatable]

    ::Bushido::Platform.on_bushido? ? bushido : standard
  end
end

# Enable Bushido enhancements if running on Bushido
require './lib/bushido/bushido_hosting'
