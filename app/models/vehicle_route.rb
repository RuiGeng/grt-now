class VehicleRoute < ActiveRecord::Base
    has_many :user_favorite_routes, dependent: :destroy    
end
