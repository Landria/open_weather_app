module ApplicationHelper
  def weather_title(weather)
    title = "Weather for #{weather.city}"
    title += ", #{weather.country.name}" if weather.country
    title
  end
end
