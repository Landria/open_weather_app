class HomeController < ApplicationController
  def index
    @weather = OpenWeatherMap::CityFetcher.fetch(params[:country], params[:city])
    flash[:alert] = @weather.errors if search_params.include?(:city)
  end

  def random
    lat = rand(-90.000000000...90.000000000)
    lon = rand(-180.000000000...180.000000000)
    @weather = OpenWeatherMap::CoordsFetcher.fetch(lat, lon)
    render :index
  end

  private

  def search_params
    params.permit(:country, :city)
  end
end
