require 'httparty'

class OpenWeatherMapFetcher
  include ::HTTParty

  ENDPOINT = 'http://api.openweathermap.org/data/2.5/weather'.freeze
  APPID = 'b0178317cb5e3c47d249176cf69353d1'.freeze

  attr_accessor :country, :city, :errors, :raw_data, :latitude, :longitude

  class << self
    def fetch(country_name, city_name)
      new(country_name, city_name).fetch
    end

    def fetch_random
      lat = rand(-90.000000000...90.000000000)
      lon = rand(-180.000000000...180.000000000)
      new(nil, nil, lat, lon).fetch
    end
  end

  def initialize(country_name, city_name, lat = nil, lon = nil)
    @city = city_name
    @country = ::Country.find_by_name(country_name)
    @errors = []
    @latitude = lat
    @longitude = lon

    validate
  end

  def fetch
    return self unless valid?

    @raw_data = JSON.parse(self.class.get(url).body)
    errors << @raw_data['message'] unless raw_data['cod'] == 200
    self
  end

  def valid?
    errors.empty?
  end

  private

  def validate
    @errors << 'Please enter country and city' unless (@city && @city.present?) or (@latitude && @longitude)
  end

  def url
    url = ENDPOINT

    if latitude && longitude
      url += "?lat=#{latitude}&lon=#{longitude}&cnt=10"
    else
      url += "?q=#{city}"
      url += ",#{country.alpha2.downcase}" if country
    end

    url += "&APPID=#{APPID}&units=metric"
    url
  end
end
