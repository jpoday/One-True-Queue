source 'http://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', :group => :development
gem 'pg', :group => :production


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.0.2'
  gem 'compass-rails'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber-rails', ">= 0.7.2", :require => false
	gem 'database_cleaner', ">= 0.5.2"
	gem 'launchy'
	gem 'spork', '> 0.9.0.rc'
	gem 'guard-rspec'
	gem 'guard-livereload'
	gem 'guard-cucumber'
	gem 'guard-spork'
	gem 'factory_girl_rails'
	gem 'capybara-webkit'
	gem 'pry'
end

group :development do
  gem "nifty-generators"
	gem "annotate"
end

group :test do

end

gem 'sorcery', '>=0.8.1'
gem 'oauth', :git => "git://github.com/jpoday/oauth-ruby"
gem 'oauth-plugin', '>= 0.4.0.pre1'
gem 'simple_form'