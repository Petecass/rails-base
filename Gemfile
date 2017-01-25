source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'

gem 'puma', '~> 3.0'

# Use sass c for faster sass compilation times
gem 'sassc-rails',  '~> 1.3.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'

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

gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'autoprefixer-rails', '6.5.3'
gem 'slim-rails'
gem 'i18n-tasks', '~> 0.9.6'
gem 'meta-tags', '~> 2.3.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'dotenv-rails'
  gem 'faker', '~>1.6.6'
  gem 'rubocop'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent', require: false
end

group :test do
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', require: false
  gem 'shoulda-callback-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
