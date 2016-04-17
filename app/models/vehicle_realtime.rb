require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'
  
class VehicleRealtime < ActiveRecord::Base
  belongs_to :vehicle_trip
  belongs_to :vehicle_route
  belongs_to :vehicle_stop
  
  def self.pull_real_time
    data = Net::HTTP.get(URI.parse("http://192.237.29.212:8080/gtfsrealtime/VehiclePositions"))
    feed = Transit_realtime::FeedMessage.decode(data)
    
    VehicleRealtime.delete_all()
    
    for entity in feed.entity do
      
      if entity.field?(:vehicle)
        begin
          obj = VehicleRealtime.new
          obj.vehicle_route_id = entity.vehicle.trip.route_id
          obj.vehicle_trip_id = entity.vehicle.trip.trip_id
          obj.current_status = entity.vehicle.current_status
          obj.lat = entity.vehicle.position.latitude
          obj.long = entity.vehicle.position.longitude
          obj.save()
        rescue
        end
      end
    end
  end
end
