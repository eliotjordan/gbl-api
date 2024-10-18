source "https://rubygems.org"
gem "blacklight", "~> 8.0"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.3"
gem "devise"
gem "devise-guests", "~> 0.8"
gem "geoblacklight", github: "geoblacklight/geoblacklight", branch: "main"
gem "importmap-rails"
gem "jbuilder"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.1"
gem "redis", ">= 4.0.1"
gem "rsolr", ">= 1.0", "< 3"
gem "rswag-api"
gem "rswag-ui"
gem "sassc-rails"
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "stimulus-rails"
gem "turbo-rails"
gem "vite_rails", "~> 3.0"

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem "web-console"
end

group :test do
  gem "axe-core-rspec"
  gem "capybara"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "simplecov", "~> 0.22"
  gem "webmock", "~> 3.14"
end

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri mswin mswin64 mingw x64_mingw], require: "debug/prelude"
  gem "rswag-specs"
  gem "standard", "~> 1.41"
end
