require 'httparty'

class ClearbitWrapper
  COMPANY_BASE_URL = "https://company.clearbit.com/v1"

  AUTH_OPTIONS = {
    basic_auth: {
      username: ENV['CLEARBIT_API_KEY']
    }
  }

  def self.domain_search(name)
    response = HTTParty.get("#{COMPANY_BASE_URL}/domains/find?name=#{name}", AUTH_OPTIONS)
    return response.parsed_response["domain"]
  end
end
