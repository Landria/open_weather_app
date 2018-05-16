class HomeController < ApplicationController
  def index
    if params['country'].present? && params['city'].present?
      @weather = []
    else
      flash[:alert] = 'Please enter country and city'
    end
  end

  private

  def search_params
    params.permit(:country, :city)
  end
end
