module OpenWeatherMap
  class CoordsFetcher

    include Base

    attr_accessor :errors, :raw_data, :latitude, :longitude

    def initialize(lat, lon)
      @errors = []
      @latitude = lat
      @longitude = lon

      validate
    end

    private

    def validate
      @errors << 'Please enter country and city' unless @latitude && @longitude
    end

    def url
      url = self.class.endpoint
      url += "?lat=#{latitude}&lon=#{longitude}&cnt=10"
      url += "&APPID=#{self.class.appid}&units=metric"
      url
    end
  end
end
