class CreateVehicleRealtimes < ActiveRecord::Migration
  def change
    create_table :vehicle_realtimes do |t|
      t.references :vehicle_trip, index: true, foreign_key: true
      t.references :vehicle_route, index: true, foreign_key: true
      t.references :vehicle_stop, index: true, foreign_key: true
      t.integer :current_status
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
