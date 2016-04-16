class CreateVehicleTrips < ActiveRecord::Migration
  def change
    create_table :vehicle_trips do |t|
      t.references :vehicle_route, index: true, foreign_key: true
      t.string :service
      t.string :name
      t.integer :direction

      t.timestamps null: false
    end
  end
end
