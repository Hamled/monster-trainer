require "test_helper"

describe Monster do
  let(:monster) { monsters(:misty_staryu) }

  describe "#valid?" do
    it "should return false without a species" do
      monster.species = nil
      monster.valid?.must_equal false
    end

    it "should return true with or without a nickname" do
      monster.valid?.must_equal true
      monster.nickname = nil
      monster.valid?.must_equal true
    end

    it "should return true with or without a trainer" do
      monster.valid?.must_equal true
      monster.trainer = nil
      monster.valid?.must_equal true
    end
  end

  describe "#name" do
    it "should return the nickname, if set" do
      monster.name.must_equal "Misty's Staryu"
    end

    it "should return the species name, if no nickname is set" do
      monsters(:wild_absol).name.must_equal "Absol"
    end
  end
end
