class CreateVehicleRoutes < ActiveRecord::Migration
  def change
    create_table :vehicle_routes do |t|
      t.string :long_name

      t.timestamps null: false
    end
  end
end
