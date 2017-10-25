require "test_helper"

describe MonstersController do
  let(:captured_monster) { monsters(:misty_staryu) }
  let(:wild_monster) { monsters(:wild_absol) }

  describe "#destroy" do
    it "should redirect to the homepage" do
      delete monster_path(captured_monster)

      must_respond_with :redirect
      must_redirect_to root_path
    end

    describe "when authenticated" do
      # For all of these tests we need to be authenticated
      # so we should always log in first.
      before do
        login_github(users(:user_with_trainer))
      end

      it "should remove if monster is captured by trainer" do
        proc {
          delete monster_path(captured_monster)
        }.must_change 'Monster.count', -1

        must_respond_with :redirect
        must_redirect_to root_path
        flash.keys.must_include "success"
      end

      it "should not remove wild monsters" do
      end
    end

    describe "when not authenticated" do
      # For all of these test we are not authenticated, so we
      # should NOT log in first
      before do
      end

      it "should not remove captured monsters" do
      end

      it "should not remove wild monsters" do
      end
    end
  end
end
