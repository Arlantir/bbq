source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem "puma", ">= 4.3.2"
gem 'webpacker', '~> 4.0'
gem 'jbuilder', '~> 2.7'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0.0'

gem 'pundit'

gem 'resque'

gem 'pg'

gem 'carrierwave', '~> 2.1'
gem 'rmagick'
gem 'fog-aws'

gem 'dotenv-rails'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'rspec-rails', '~> 4.0.0'

  gem "factory_bot_rails"
end

group :development do
  # для деплоя
  gem 'capistrano', '~> 3.13', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.6'
  gem "capistrano-resque", "~> 0.2.3", require: false

  gem 'foreman'
  gem 'letter_opener'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
