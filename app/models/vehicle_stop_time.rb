class VehicleStopTime < ActiveRecord::Base
  belongs_to :vehicle_stop
  belongs_to :vehicle_trip
end
