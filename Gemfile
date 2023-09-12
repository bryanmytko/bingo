source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.4", ">= 7.0.4"
gem "devise"
gem "puma", "~> 5.0"
gem "jbuilder", "~> 2.7"
gem 'sprockets-rails', :require => 'sprockets/railtie'

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
end

group :test do
  gem "rspec-rails"
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "pg", "~> 1.2"

gem "tailwindcss-rails", "~> 2.0"

gem "cssbundling-rails", "~> 1.3"
