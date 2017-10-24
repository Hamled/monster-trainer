require "test_helper"

describe MonstersController do
  let(:captured_monster) { monsters(:misty_staryu) }

  describe "#destroy" do
    it "should redirect to the homepage" do
      delete monster_path(captured_monster)

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end
end
