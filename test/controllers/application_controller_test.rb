require "test_helper"

describe ApplicationController do
  describe "#current_user" do
    it "should return the logged in user" do
      user = users(:github_user)

      # First log into the site
      login_github(user)

      @controller.current_user.must_equal user
    end

    it "should return nil when not logged in" do
      # Don't log into the site, but DO make a request
      get root_path

      @controller.current_user.must_be_nil
    end
  end

  describe "#logged_in?" do
    it "should return true when logged in" do
      user = users(:github_user)

      # First log into the site
      login_github(user)

      @controller.logged_in?.must_equal true
    end

    it "should return false when not logged in" do
      # Don't log into the site, but DO make a request
      get root_path

      @controller.logged_in?.must_equal false
    end
  end
end
