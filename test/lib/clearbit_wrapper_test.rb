require 'test_helper'

describe ClearbitWrapper do
  describe "#domain_search" do
    it "returns a domain name for known companies" do
      VCR.use_cassette("domain_search") do
        # Arrange
        name = "Del Taco"

        # Act
        result = ClearbitWrapper.domain_search(name)

        # Assert
        result.must_equal "deltacofranchise.com"
      end
    end

    it "returns nil for unknown companies" do
      VCR.use_cassette("domain_search") do
        name = "This is not a real company"
        result = ClearbitWrapper.domain_search(name)
        result.must_equal nil
      end
    end
  end

  describe "#logo_search" do
    it "returns a data URL for domains with a known logo" do
      VCR.use_cassette("logo_search") do
        logo_url = ClearbitWrapper.logo_search("intel.com")

        # There are better tests we could do if we use the 'data_uri' gem
        # Check it out here: https://github.com/dball/data_uri
        logo_url.must_be_kind_of String
        logo_url.must_match /^data:image\/png;base64/
      end
    end

    it "returns nil for domains without a known logo" do
      VCR.use_cassette("logo_search") do
        ClearbitWrapper.logo_search("thisshouldnotbearealwebsite.com").must_be_nil
      end
    end
  end
end
