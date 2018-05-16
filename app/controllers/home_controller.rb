class HomeController < ApplicationController
  def index
    @weather = OpenWeatherMapFetcher.new(params[:country], params[:city]).fetch
    flash[:alert] = @weather.errors if search_params.include?(:city)
  end

  private

  def search_params
    params.permit(:country, :city)
  end
end
