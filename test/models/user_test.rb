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
end
