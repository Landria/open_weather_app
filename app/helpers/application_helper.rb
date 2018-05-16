module ApplicationHelper
  def weather_title(weather)
    title = "Weather for #{weather.city}"
    title += ", #{weather.country.name}" if weather.country
    title
  end

  def time_from_timestamp(time_s)
    Time.strptime(time_s, '%s').strftime("at %I:%M%p")
  end
end
