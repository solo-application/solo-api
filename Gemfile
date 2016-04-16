source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use for cross-origin requests
gem 'rack-cors', require: 'rack/cors'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'
  # Causes rails console to open pry
  gem 'pry-rails'
  # A testing framework for Rails
  gem 'rspec-rails', '~> 3.0'
  # Patch-level verification for Bundler ($ bundle-audit)
  gem 'bundler-audit', require: false
  # Pretty print your Ruby objects with style
  gem 'awesome_print'
  # Helps handle JSON in RSpec
  gem 'json_spec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Implements the rspec command for Spring
  gem 'spring-commands-rspec', group: :development
  # Better and more useful error page
  gem 'better_errors'
end
