require "test_helper"

describe Species do
  let(:subject) { species(:staryu) }

  describe "#valid?" do
    it "should return false without a name" do
      subject.name = nil
      subject.valid?.must_equal false
    end

    it "should return false with a short name" do
      subject.name = "A"
      subject.valid?.must_equal false
    end

    it "should return false without a type" do
      subject.species_type = nil
      subject.valid?.must_equal false
    end
  end
end
