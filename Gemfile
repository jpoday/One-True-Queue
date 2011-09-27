source 'http://rubygems.org'
source 'http://gemcutter.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', :group => :development
gem 'pg', :group => :production


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'webrat'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ruby-debug19', :require => 'ruby-debug'
	gem 'autotest-rails'
	gem 'autotest'
	gem 'autotest-growl'
	gem 'autotest-fsevent'
	gem 'cucumber-rails', ">= 0.7.2"
	gem 'database_cleaner', ">= 0.5.2"
	gem 'selenium-client', ">= 1.2.18"
	gem 'launchy'
	gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
	gem 'guard-rspec'
	gem 'guard-livereload'
	gem 'guard-cucumber'
	gem 'growl'
	gem 'growl_notify'
	gem 'spork', '> 0.9.0.rc'
	gem 'guard-spork'
end

group :development do
  gem "nifty-generators"
	gem "annotate"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

gem 'sorcery'