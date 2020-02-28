source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.6.5'

gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'bcrypt', '3.1.13'
gem 'bootstrap4-datetime-picker-rails'
gem 'carrierwave'
gem 'cancancan'
gem 'dotenv-rails'
gem 'devise'
gem 'faker'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'high_voltage'
gem 'mini_racer', platforms: :ruby
gem 'mini_magick'
gem 'momentjs-rails'
gem 'omniauth'
gem 'omniauth-google-oauth2', git: "git@github.com:zquestz/omniauth-google-oauth2.git", tag: "v0.7.0"
gem 'omniauth-rails_csrf_protection'
gem 'rails_admin', '~> 2.0'
gem 'ransack'
gem 'rspotify', git: "git@github.com:guilhermesad/rspotify.git", tag: "v2.8.0"
gem 'unicorn'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'bullet'
  gem 'bcrypt_pbkdf'
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'rack-mini-profiler', require: false
  gem 'rails_best_practices', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
