class WeatherSerializer < ActiveModel::Serializer
  attributes :id, :temperature, :humidity
end
