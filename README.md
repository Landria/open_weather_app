# open_weather_app

## To run application

```
git clone git@github.com:Landria/open_weather_app.git
cd open_weather_app && bundle install
rails s
```

The app will be available via 0.0.0.0:3000 address

## TODOs
1. Better weather data visualization
2. Move all string messages from code to locales
3. Add OpenWeatherMapApi requests caching
4. Use a DB to store cities and countries data
5. Make OpenWeatherMapApi requests by city ID
6. Add storing of 'home' user city
7. Store a request history for a user (add registration?)
8. More specs (addd VCR gem)
9. Add city and country field autocompletion
10. Use AJAX for search request
