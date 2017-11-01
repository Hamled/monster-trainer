ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...

  def setup
    OmniAuth.config.test_mode = true
  end

  def auth_hash_github
    return {
      provider: "github",
      uid: 987654321,
      info: {
        email: "test-github-user@example.com",
        nickname: "Test GitHub User"
      }
    }
  end

  def auth_hash(user)
    return {
      provider: user.provider,
      uid: user.uid,
      info: auth_hash_github[:info]
    }
  end

  def login_github(user = nil)
    auth_hash = user ? auth_hash(user) : auth_hash_github
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    get auth_callback_github_path
  end
end

# VCR setup
VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri, :body]
  }

  config.filter_sensitive_data("<CLEARBIT API KEY>") do
    ENV['CLEARBIT_API_KEY']
  end
end
