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
end
