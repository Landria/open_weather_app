require 'httparty'

class OpenWeatherMapFetcher
  include ::HTTParty

  ENDPOINT = 'http://api.openweathermap.org/data/2.5/weather'.freeze
  APPID = 'b0178317cb5e3c47d249176cf69353d1'.freeze

  attr_accessor :country, :city, :errors, :raw_data

  def initialize(country_name, city_name)
    @city = city_name
    @country = ::Country.find_by_name(country_name)
    @errors = []
    validate
  end

  def fetch
    return unless valid?
    @raw_data = JSON.parse(self.class.get(url).body)
    errors << @raw_data['message'] unless raw_data['cod'] == 200
    self
  end

  def valid?
    errors.empty?
  end

  private

  def validate
    @errors << 'Empty data' unless @city
  end

  def url
    url = ENDPOINT + "?q=#{city}"
    url += ",#{country.alpha2.downcase}" if country
    url += "&APPID=#{APPID}&units=metric"
    url
  end
end
