require 'test_helper'

describe ClearbitWrapper do
  describe "#domain_search" do
    it "returns a domain name for known companies" do
      VCR.use_cassette("domain_search") do
        # Fill this in
      end
    end

    it "returns nil for unknown companies" do
      VCR.use_cassette("domain_search") do
        # Fill this in
      end
    end
  end
end
