class CreateUserFavoriteRoutes < ActiveRecord::Migration
  def change
    create_table :user_favorite_routes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :vehicle_route, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
