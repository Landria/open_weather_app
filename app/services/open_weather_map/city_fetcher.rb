module OpenWeatherMap
  class CityFetcher

    include Base

    attr_accessor :country, :city, :errors, :raw_data

    def initialize(country_name, city_name)
      @city = city_name
      @country = ::Country.find_by_name(country_name)
      @errors = []

      validate
    end

    private

    def validate
      @errors << 'Please enter country and city' unless @city && @city.present?
    end

    def url
      url = self.class.endpoint
      url += "?q=#{city}"
      url += ",#{country.alpha2.downcase}" if country
      url += "&APPID=#{self.class.appid}&units=metric"
      url
    end
  end
end
