require "test_helper"

describe SessionsController do
  let(:user) { users(:github_user) }

  describe "#create" do
    it "should update the session with user ID" do
      login_github(user)

      session[:user_id].must_equal user.id
      must_redirect_to root_path
    end

    it "should create a new user on first login" do
      proc {
        login_github
      }.must_change "User.count", 1
    end

    it "should not create a new user on repeat logins" do
      proc {
        3.times do
          login_github(user)
        end
      }.wont_change "User.count"
    end

    it "should create a new trainer if user does not have one" do
      proc {
        login_github(user)
      }.must_change "Trainer.count", 1
    end

    it "should not create a new trainer for existing users" do
      proc {
        login_github(users(:user_with_trainer))
      }.wont_change "Trainer.count"
    end
  end
end
