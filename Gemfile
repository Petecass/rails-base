# frozen_string_literal: true
# rubocop:disable Style/ExtraSpacing
source 'https://rubygems.org'

gem 'rails',   '~> 5.0.1'

gem 'puma',    '~> 3.7.0'
gem 'sqlite3', '1.3.13'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder',     '~> 2.5'
gem 'jquery-rails', '~> 4.2.2'
# Use sass c for faster sass compilation times
gem 'sassc-rails',  '~> 1.3.0'
gem 'turbolinks',   '~> 5'
gem 'uglifier',     '~> 3.0.4'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'omniauth', '~> 1.3.2'
# Choose your Oauth provider(s), You will need to add the key and secret to
# config/initializers/devise.rb and also add the provider to the omniauthable
# array on the user model
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# gem 'omniauth-github'
# gem 'omniauth-twitter'
# gem 'omniauth-linkedin'

gem 'autoprefixer-rails', '~> 6.7.1'
gem 'i18n-tasks',         '~> 0.9.9'
gem 'meta-tags',          '~> 2.4.0'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'slim-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails',       '~> 2.2.0'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'faker',              '~> 1.7.2'
  gem 'growl'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'rubocop',            '~> 0.47.1', require: false
  gem 'spring-commands-rspec'
end

group :development do
  gem 'guard-livereload',      require: false
  gem 'listen',                '~> 3.1.5'
  gem 'rack-livereload'
  gem 'rb-fsevent',            require: false
  gem 'spring',                '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  gem 'capybara',                  '~> 2.12.0'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver',        '~> 3.0.5'
  gem 'shoulda-callback-matchers'
  gem 'shoulda-matchers',          require: false
  gem 'simplecov',                 '~> 0.13.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
