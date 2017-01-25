# frozen_string_literal: true
source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'

gem 'puma', '~> 3.0'

# Use sass c for faster sass compilation times
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder',     '~> 2.5'
gem 'jquery-rails'
gem 'sassc-rails',  '~> 1.3.0'
gem 'turbolinks',   '~> 5'
gem 'uglifier',     '>= 1.3.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'omniauth'
# Choose your Oauth provider(s), You will need add the key and secret to
# config/initializers/devise.rb and also add the provider to the omniauthable
# array on the user model
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# gem 'omniauth-github'
# gem 'omniauth-twitter'
# gem 'omniauth-linkedin'

gem 'autoprefixer-rails', '6.5.3'
gem 'i18n-tasks', '~> 0.9.6'
gem 'meta-tags', '~> 2.3.1'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'slim-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker', '~>1.6.6'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'spring-commands-rspec'
end

group :development do
  gem 'guard-livereload', require: false
  gem 'listen', '~> 3.0.5'
  gem 'rack-livereload'
  gem 'rb-fsevent', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
