json.array!(@vehicle_realtimes) do |vehicle_realtime|
  json.extract! vehicle_realtime, :id, :vehicle_trip_id, :vehicle_route_id, :vehicle_stop_id, :current_status, :lat, :long
  json.url vehicle_realtime_url(vehicle_realtime, format: :json)
end
