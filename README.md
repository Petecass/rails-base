# README
[![Build Status](https://travis-ci.org/Petecass/rails-base.svg?branch=master)](https://travis-ci.org/Petecass/rails-base)
[![Dependency Status](https://gemnasium.com/badges/github.com/Petecass/rails-base.svg)](https://gemnasium.com/github.com/Petecass/rails-base)
[![Code Climate](https://codeclimate.com/github/Petecass/rails-base/badges/gpa.svg)](https://codeclimate.com/github/Petecass/rails-base)
[![Test Coverage](https://codeclimate.com/github/Petecass/rails-base/badges/coverage.svg)](https://codeclimate.com/github/Petecass/rails-base/coverage)
[![Issue Count](https://codeclimate.com/github/Petecass/rails-base/badges/issue_count.svg)](https://codeclimate.com/github/Petecass/rails-base)

This is a basic starting point for most Rails 5 applications.

Comes setup with a PostgreSQL db, user authentication with devise and omniauth setup my default.

Other features include a solid Sass architecture, Semantic UI as a front-end frame work for styling, slim templating for views and mailers, default meta tags setup for site title, description etc and nested layouts.

To setup:

- `bundle` to install all gems
- `bundle exec rails db:create` to create the database. note you will need to have Postgres installed on your machine.
- `bundle exec rails db:schema:load`
- `bundle exec rails s` to run the server
- you can also use guard `bundle exec guard` for automated testing and live reloading of assets.
- `bundle exec rspec spec` to run all specs.
- `bundle exec rake rubocop` to lint all your ruby code.
