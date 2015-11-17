json.array!(@weathers) do |weather|
  json.extract! weather, :id, :temperature, :humidity
  json.url weather_url(weather, format: :json)
end
