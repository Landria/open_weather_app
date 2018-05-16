module ApplicationHelper
  def weather_title(weather)
    title = 'Weather for '

    if weather.try(:city)
      title += weather.city
      title += ", #{weather.country.name}" if weather.country
    else
      title += @weather.raw_data['name']
    end

    title
  end

  def time_from_timestamp(time_s)
    Time.strptime(time_s, '%s').strftime('at %I:%M%p')
  end
end
