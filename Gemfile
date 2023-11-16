# frozen_string_literal: true

# If you do not have OpenSSL installed, change
# the following line to use "http://"
source "https://rubygems.org"

ruby "3.2.2"

# Windows support
gem "tzinfo-data", platforms: %i[mswin mingw jruby]
gem "wdm", platforms: %i[mswin mingw]

gem "rake"

# Include the tech docs gem
gem "govuk_tech_docs"
gem "ruby-graphviz"

group :development do
  gem "pry"
end

group :test do
  gem "axe-core-rspec"
  gem "capybara"
  gem "capybara-screenshot-diff"
  gem "diffy"
  gem "faraday-http-cache"
  gem "faraday_middleware"
  gem "html-pipeline"
  gem "htmlbeautifier"
  gem "octokit"
  gem "oily_png", platform: :ruby
  gem "rspec"
  gem "rubocop-govuk"
  gem 'selenium-webdriver'
  gem "site_prism"
  gem "webdrivers"
  gem "webmock"
end
