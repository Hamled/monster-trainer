require "test_helper"

describe User do
  let(:user) { users(:github_user) }

  describe "#valid?" do
    it "should return false without a UID" do
      user.uid = nil
      user.valid?.must_equal false
    end

    it "should return false without a provider" do
      user.provider = nil
      user.valid?.must_equal false
    end

    it "should return false if provider is not 'github'" do
      user.provider = "not github"
      user.valid?.must_equal false
    end

    it "should return false with a non-unique UID & provider" do
      user2 = User.new(uid: user.uid, provider: user.provider)
      user2.valid?.must_equal false
    end
  end

  describe ".find_or_create_by_github" do
    let(:existing_auth_hash) { OmniAuth::AuthHash.new(auth_hash(user)) }
    let(:new_auth_hash) { OmniAuth::AuthHash.new(auth_hash_github) }
    let(:invalid_auth_hash) { OmniAuth::AuthHash.new({ provider: "github", uid: nil }) }

    it "should return a existing users" do
      proc {
        User.find_or_create_by_github(existing_auth_hash).must_equal user
      }.wont_change "User.count"
    end

    it "should create and return new users" do
      proc {
        new_user = User.find_or_create_by_github(new_auth_hash)

        new_user.must_be_kind_of User
        new_user.persisted?.must_equal true
      }.must_change "User.count", 1
    end

    it "should not create a user if auth hash is invalid" do
      proc {
        invalid_user = User.find_or_create_by_github(invalid_auth_hash)

        invalid_user.must_be_kind_of User
        invalid_user.valid?.must_equal false
        invalid_user.persisted?.must_equal false
      }.wont_change "User.count"
    end
  end

  describe "#trainer" do
    let(:user) { users(:user_with_trainer) }

    it "should return the associated trainer" do
      user.trainer.must_equal trainers(:misty)
    end

    it "should return nil with no associated trainer" do
      users(:github_user).trainer.must_be_nil
    end
  end
end
