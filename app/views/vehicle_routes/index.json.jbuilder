json.array!(@vehicle_routes) do |vehicle_route|
  json.extract! vehicle_route, :id, :long_name
  json.url vehicle_route_url(vehicle_route, format: :json)
end
