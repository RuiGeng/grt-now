json.array!(@vehicle_stops) do |vehicle_stop|
  json.extract! vehicle_stop, :id, :name, :lat, :long
  json.url vehicle_stop_url(vehicle_stop, format: :json)
end
