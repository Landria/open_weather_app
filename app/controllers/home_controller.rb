class HomeController < ApplicationController
  def index
    if search_params[:city].present?
      @weather = OpenWeatherMapFetcher.new(params[:country], params[:city]).fetch
      flash[:alert] = @weather.errors
    else
      flash[:alert] = 'Please enter country and city' if search_params.include?(:city)
    end
  end

  private

  def search_params
    params.permit(:country, :city)
  end
end
