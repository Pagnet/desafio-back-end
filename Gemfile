source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'rails-i18n'
gem 'devise-i18n'
gem 'sidekiq'
gem 'haml-rails'
gem 'kaminari'
gem 'awesome_print'
gem 'draper'
gem 'rack-attack'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'bundler-audit', require: false
  gem 'rails_best_practices'
end

group :development, :production do
  gem 'twitter-bootstrap-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
end

group :development do
  gem 'guard', require: false
  gem 'guard-rails_best_practices', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-rspec', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
end
