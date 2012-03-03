source 'http://rubygems.org'

# Core gems
gem 'rails', '3.1.3'
gem 'sqlite3'
gem 'cancan'
gem 'jquery-rails'

# Bushido gems
gem "devise"
gem "devise_bushido_authenticatable"
gem "bushido"
gem "tane", :group => "development"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem "haml-rails"
  gem "compass-rails"
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# prevent slowdown from loading Bootstrap
gem 'rails-dev-tweaks', '~> 0.6.1'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Testing and debug
gem "rspec-rails", :group => "development"
gem "awesome_print", :group => "development"

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
