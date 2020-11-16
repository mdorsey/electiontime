source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# LAST UPDATED: OCT 28, 2020

ruby '2.6.1'

gem 'rails', '~> 6.0', '>= 6.0.3.4'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.3'

# Use Puma as the app server
gem 'puma', '~> 5.0', '>= 5.0.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'

# Turbolinks makes navigating your web application faster. https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Provides jQuery support
gem 'jquery-rails', '~> 4.4'

# Provides a simple API for performing paginated queries with Active Record
gem 'will_paginate', '~> 3.3'

# Integrates Bulma with the rails asset pipeline. https://github.com/joshuajansen/bulma-rails
gem "bulma-rails", "~> 0.9.0"

# Integrates the Bulma pagination component with the will_paginate gem. https://github.com/phoffer/will_paginate-bulma
gem 'will_paginate-bulma', '~> 1.0'

# Manages and displays breadcrumb trails. https://github.com/piotrmurach/loaf
gem 'loaf', '~> 0.9.0'

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