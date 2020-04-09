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

gem 'pg'

gem 'carrierwave', '~> 2.0'
gem 'rmagick'
gem 'fog-aws'

gem 'dotenv-rails'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'foreman'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
