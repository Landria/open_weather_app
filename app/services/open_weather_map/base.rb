require 'httparty'

module OpenWeatherMap
  module Base

    extend ActiveSupport::Concern

    OPEN_WEATHER_MAP_ENDPOINT = 'http://api.openweathermap.org/data/2.5/weather'.freeze
    OPEN_WEATHER_MAP_APPID = 'b0178317cb5e3c47d249176cf69353d1'.freeze

    included do
      def self.fetch(attr1, attr2)
        new(attr1, attr2).fetch
      end

      def self.endpoint
        OPEN_WEATHER_MAP_ENDPOINT
      end

      def self.appid
        OPEN_WEATHER_MAP_APPID
      end
    end

    def fetch
      return self unless valid?
      @raw_data = JSON.parse(HTTParty.get(url).body)
      errors << @raw_data['message'] unless raw_data['cod'] == 200

      self
    end

    def valid?
      errors.empty?
    end
  end
end
