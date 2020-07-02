# frozen_string_literal: true

class TemperaturesController < ApplicationController
  def get_temperature(city)
    require 'net/http'
    require 'json'

    url = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric&appid=4f416da763a05965e2e042b8d89c100c'
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.encode(url.strip))
    end

    response = Net::HTTP.get(uri)
    get_current_city_weather =JSON.parse(response)
    if get_current_city_weather['cod'] == 200
      get_current_city_temp = get_current_city_weather['main']['temp']
      get_current_city_temp.round(1)
    end
  end
end
