require 'httparty'

class EasyBroker::Api
  include HTTParty
  base_uri 'https://api.stagingeb.com/v1'

  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_properties_titles(page: 1, limit: 20)
    response = make_api_request("/properties?page=#{page}&limit=#{limit}")

    if response.success?
      properties = response.parsed_response['content']
      titles = properties.map { |property| property['title'] }
      { titles: titles, errors: nil}
    else
      { titles: nil, errors: response.parsed_response }
    end
  end

  private

  def make_api_request(endpoint)
    self.class.get(endpoint, headers: { 'X-Authorization' => "#{@api_key}" })
  end
end