class UserFavoriteRoute < ActiveRecord::Base
  belongs_to :user
  belongs_to :vehicle_route
end
