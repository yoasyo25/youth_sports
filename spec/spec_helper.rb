require 'simplecov'
require 'support/integration_spec_helper'
SimpleCov.start 'rails'

def stub_facebook
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: "facebook",
    uid: "12345678",
    info: {
        name: "Katie Keel",
        email: "katie@keel.com"
    },
    credentials: {
      token: "a1b1c1d1"
    }
    })
end

def stub_twitter
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: "twitter",
    uid: "12345678",
    info: {
        name: "Katie Keel"
    },
    credentials: {
      token: "a1b1c1d1"
    }
    })
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
