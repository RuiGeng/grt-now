json.array!(@vehicle_trips) do |vehicle_trip|
  json.extract! vehicle_trip, :id, :vehicle_route_id, :service, :name, :direction
  json.url vehicle_trip_url(vehicle_trip, format: :json)
end
