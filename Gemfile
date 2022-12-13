source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

gem 'acts-as-taggable-on', '~> 9.0'
gem 'rails', '6.1.7'
gem 'pg', '1.4.5'
gem 'puma'
gem 'sass-rails'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'rails_admin'
gem 'redcarpet'
gem 'erubis'
gem 'rack-attack'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

group :development, :test do
  gem 'rspec-rails', '6.0.1'
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
  gem 'faker'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1.0'
end

group :test do
  gem 'rake'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
end

gem 'sassc-rails'
