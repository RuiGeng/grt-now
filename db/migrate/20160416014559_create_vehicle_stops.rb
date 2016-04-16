class CreateVehicleStops < ActiveRecord::Migration
  def change
    create_table :vehicle_stops do |t|
      t.string :name
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
