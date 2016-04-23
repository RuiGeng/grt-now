json.array!(@user_favorite_routes) do |user_favorite_route|
  json.extract! user_favorite_route, :id, :user_id, :vehicle_route_id
  json.url user_favorite_route_url(user_favorite_route, format: :json)
end
