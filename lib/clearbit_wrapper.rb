require 'httparty'
require 'base64'

class ClearbitWrapper
  COMPANY_BASE_URL = "https://company.clearbit.com/v1"
  LOGO_BASE_URL = "https://logo.clearbit.com"

  AUTH_OPTIONS = {
    basic_auth: {
      username: ENV['CLEARBIT_API_KEY']
    }
  }

  def self.domain_search(name)
    response = HTTParty.get("#{COMPANY_BASE_URL}/domains/find?name=#{name}", AUTH_OPTIONS)
    return response.parsed_response["domain"]
  end

  def self.logo_search(domain)
    logo_png = HTTParty.get("#{LOGO_BASE_URL}/#{domain}").parsed_response
    return nil unless logo_png.present?

    # Convert the PNG data into an in-line PNG
    prefix = "data:image/png;base64,"
    logo_base64 = Base64.encode64(logo_png).chomp

    return prefix + logo_base64
  end
end
