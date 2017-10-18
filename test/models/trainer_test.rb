require "test_helper"

describe Trainer do
  let(:trainer) { trainers(:misty) }

  describe "#valid?" do
    it "should return false without a name" do
      trainer.name = nil
      trainer.valid?.must_equal false
    end

    it "should return false without a trainer class" do
      trainer.trainer_class = nil
      trainer.valid?.must_equal false
    end
  end

  describe "#monsters" do
    it "should return a collection of monsters" do
      trainer.monsters.must_be_kind_of Enumerable
    end

    it "should include monsters captured by this trainer" do
      trainer.monsters.must_include monsters(:misty_staryu)
    end
  end

  describe "#capture!" do
    let(:trainer) { trainers(:astrid) }
    let(:wild_monster) { monsters(:wild_absol) }
    let(:captured_monster) { monsters(:misty_staryu) }

    it "should add monster to trainer's collection" do
      # Monster is not in collection when we start
      trainer.monsters.wont_include wild_monster

      trainer.capture!(wild_monster)

      # Monster is now in the collection
      trainer.monsters.must_include wild_monster
    end

    it "should give the monster a nickname if provided" do
      # Monster starts without a nickname
      wild_monster.nickname.must_be_nil

      trainer.capture!(wild_monster, nickname: "Astrid's Absol")

      # Monster now has the given nickname
      wild_monster.nickname.must_equal "Astrid's Absol"
    end

    it "should raise an error for already-captured monsters" do
      proc {
        trainer.capture!(captured_monster)
      }.must_raise MonsterCaptureError
    end
  end

  describe "#user" do
    it "should return the associated user" do
      trainer.user.must_equal users(:user_with_trainer)
    end

    it "should return nil with no associated user" do
      trainers(:astrid).user.must_be_nil
    end
  end
end
