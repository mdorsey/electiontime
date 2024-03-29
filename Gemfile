source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# LAST UPDATED: OCT 28, 2020

ruby '2.6.1'

gem 'rails', '~> 6.0', '>= 6.0.3.4'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.3'

# Use Puma as the app server
gem 'puma', '~> 5.0', '>= 5.0.4'

# Use Capistrano for deploying to production
gem 'capistrano', '~> 3.16'
gem 'capistrano-rails', '~> 1.6', '>= 1.6.1'
gem 'capistrano-passenger', '~> 0.2.1'
gem 'capistrano-rbenv', '~> 2.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'

# Turbolinks makes navigating your web application faster. https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# High-level wrapper for processing images for the web with ImageMagick or libvips. https://github.com/janko/image_processing
gem 'image_processing', '~> 1.12', '>= 1.12.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Provides a simple API for performing paginated queries with Active Record
gem 'will_paginate', '~> 3.3'

# Integrates Bulma with the rails asset pipeline. https://github.com/joshuajansen/bulma-rails
gem "bulma-rails", "~> 0.9.0"

# Integrates the Bulma pagination component with the will_paginate gem. https://github.com/phoffer/will_paginate-bulma
gem 'will_paginate-bulma', '~> 1.0'

# Manages and displays breadcrumb trails. https://github.com/piotrmurach/loaf
gem 'loaf', '~> 0.10.0'

# Mailgun's Official Ruby SDK for interacting with the Mailgun API. https://github.com/mailgun/mailgun-ruby
gem 'mailgun-ruby', '~> 1.2', '>= 1.2.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code. https://github.com/rails/web-console/
  gem 'web-console', '~> 4.0', '>= 4.0.4'
  gem 'listen', '~> 3.2', '>= 3.2.1'

  # Spring speeds up development by keeping your application running in the background. https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'

  # Rails Database Viewer and SQL Query Runner. https://github.com/igorkasyanchuk/rails_db
  gem 'rails_db', '~> 2.3', '>= 2.3.1'

  # For creating fake data. https://github.com/faker-ruby/faker/
  gem 'faker', '~> 2.14'

  # Used to check for security issues in Gems. https://github.com/rubysec/bundler-audit
  gem 'bundler-audit'

  # Provides intellisense, code completion, and inline documentation for Ruby. https://marketplace.visualstudio.com/items?itemName=castwide.solargraph
  gem 'solargraph'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]