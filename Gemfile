ruby '2.4.1'
source 'https://rubygems.org'

gem 'rails', '5.1.1'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'rails_admin'
gem 'redcarpet'
gem 'erubis'

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rake'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
