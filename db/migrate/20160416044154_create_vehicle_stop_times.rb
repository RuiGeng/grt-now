class CreateVehicleStopTimes < ActiveRecord::Migration
  def change
    create_table :vehicle_stop_times do |t|
      t.string :departure_time
      t.references :vehicle_stop, index: true, foreign_key: true
      t.references :vehicle_trip, index: true, foreign_key: true
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
