json.array!(@users_favorite_routes) do |users_favorite_route|
  json.extract! users_favorite_route, :id, :user_id, :vehicle_route_id
  json.url users_favorite_route_url(users_favorite_route, format: :json)
end
