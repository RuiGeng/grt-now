json.array!(@vehicle_stop_times) do |vehicle_stop_time|
  json.extract! vehicle_stop_time, :id, :departure_time, :vehicle_stop_id, :trip_id, :sequence
  json.url vehicle_stop_time_url(vehicle_stop_time, format: :json)
end
