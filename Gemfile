source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.4", ">= 7.0.4"

gem "bootsnap", ">= 1.4.4", require: false
gem "cssbundling-rails", "~> 1.3"
gem "devise", "~> 4.9"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.2"
gem "puma", "~> 5.0"
gem "redis"
gem "tailwindcss-rails", "~> 2.0"
gem "turbo-rails"
gem "sprockets-rails"
gem "stimulus-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "hotwire-livereload"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rubocop", require: false
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "importmap-rails", "~> 1.2"
