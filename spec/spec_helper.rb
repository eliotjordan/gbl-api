# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "simplecov"
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

SimpleCov.start "rails" do
  add_filter "/spec"
  minimum_coverage 100
end

require "database_cleaner"
require "action_cable/engine"
require "factory_bot"
require File.expand_path("../../config/environment", __FILE__)
require "rails-controller-testing"
require "rspec/rails"
require "capybara/rspec"
require "selenium-webdriver"

# Setup webmock for specific tests
require "webmock/rspec"
WebMock.allow_net_connect!(net_http_connect_on_start: true)

Capybara.javascript_driver = :selenium_chrome_headless

require "geoblacklight"

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

# FactoryBot.definition_file_paths = [File.expand_path("../factories", __FILE__)]
# FactoryBot.find_definitions

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  if Rails::VERSION::MAJOR >= 5
    config.include ::Rails.application.routes.url_helpers
    config.include ::Rails.application.routes.mounted_helpers
  else
    config.include BackportTestHelpers, type: :controller
  end

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponentCapybaraTestHelpers, type: :component
end
