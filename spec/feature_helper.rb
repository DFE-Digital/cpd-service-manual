# frozen_string_literal: true

require "spec_helper"

require "webdrivers/chromedriver"
require "capybara/screenshot/diff"
require "axe-rspec"
require "site_prism"

# needs to be loaded before any of the actual PageObjects
require_relative "./support/features/pages/base_page"

# Utilize spec support files like shared_examples
Dir["./spec/support/**/**/*.rb"].sort.each { |f| require f }

Capybara.register_driver :chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless") unless ENV["NOT_HEADLESS"]
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--window-size=1400,1400")

  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
end
Capybara.server = :webrick
Capybara.server_port = 9887 + ENV["TEST_ENV_NUMBER"].to_i
Capybara.default_driver = :chrome_headless
Capybara.javascript_driver = :chrome_headless
Capybara.automatic_label_click = true
Capybara.save_path = "tmp/capybara"

# Configure middleman
tech_docs_app = ::Middleman::Application.new do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), ".."))
  set :environment, :test
  set :show_exceptions, false
end
Capybara.app = ::Middleman::Rack.new(tech_docs_app).to_app

# Capybara::Screenshot.window_size = [1400, 1400]
Capybara::Screenshot.enabled = true
Capybara::Screenshot.stability_time_limit = 0.5
Capybara::Screenshot.hide_caret = true
Capybara::Screenshot::Diff.enabled = true
Capybara::Screenshot::Diff.color_distance_limit = 42
Capybara::Screenshot::Diff.shift_distance_limit = 1
Capybara::Screenshot::Diff.area_size_limit = 42

RSpec.configure do |config|
  config.include Capybara::Screenshot::Diff::TestMethods

  config.include SnapshotDiffHelper
  config.include AxeAndScreenshotHelper
  config.include Steps::GenericPageObjectSteps

  # need this for percy and axe
  config.before(:each, type: :feature) do
    WebMock.disable_net_connect! allow_localhost: true,
                                 allow: "chromedriver.storage.googleapis.com"
  end
end
