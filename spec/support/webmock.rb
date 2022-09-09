# frozen_string_literal: true

require "webmock/rspec"

include WebMock::API

WebMock.enable!
# WebMock.disable_net_connect! allow_localhost: true, allow: %w[chromedriver.storage.googleapis.com]
WebMock.disable_net_connect! allow: %w[chromedriver.storage.googleapis.com 127.0.0.1]

stub_request(:get, "https://api.github.com/repos/DFE-Digital/early-careers-framework/contents/documentation")
  .to_return(status: 200, body: [], headers: {})

stub_request(:get, "https://api.github.com/repos/DFE-Digital/early-careers-framework/contents/documentation/adr")
  .to_return(status: 200, body: [], headers: {})

stub_request(:get, "https://api.github.com/repos/DFE-Digital/ecf-engage-and-learn/contents/documentation")
  .to_return(status: 200, body: [], headers: {})
