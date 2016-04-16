namespace :grtrobot do
  
  require 'protobuf'
  require 'google/transit/gtfs-realtime.pb'
  require 'net/http'
  require 'uri'
  require 'smarter_csv'
  
  task pull_real_time: :environment do
    VehicleRealtime.pull_real_time()
  end
  
  task import_grt_routes: :environment do
    # import routes 
    SmarterCSV.process(File.join(Rails.root, '/tmp/grt_temp/routes.txt')) do |chunk|
      chunk.each do |h| 
        VehicleRoute.find_or_create_by(id: h[:route_id].to_i) do |obj|
          obj.long_name = h[:route_long_name]
          
          puts h
        end
      end
    end
  end
  
  task import_grt_stops: :environment do
    # import stops
    SmarterCSV.process(File.join(Rails.root, '/tmp/grt_temp/stops.txt')) do |chunk|
      chunk.each do |h| 
        VehicleStop.find_or_create_by(id: h[:stop_id].to_i) do |obj|
          obj.name = h[:stop_name]
          obj.lat = h[:stop_lat]
          obj.long = h[:stop_lon]
          
          puts h
        end
      end
    end
  end
  
  task import_grt_trips: :environment do
    VehicleTrip.delete_all()
    
    # import stops
    SmarterCSV.process(File.join(Rails.root, '/tmp/grt_temp/trips.txt')) do |chunk|
      chunk.each do |h| 
        VehicleTrip.find_or_create_by(id: h[:trip_id].to_i) do |obj|
          obj.vehicle_route_id = h[:route_id]
          obj.service = h[:service_id]
          obj.name = h[:trip_headsign]
          obj.direction = h[:direction_id]
        
          puts h
        end
      end
    end
  end
  
  task import_grt_stop_times: :environment do
    # clean the table
    VehicleStopTime.delete_all()
    
    # import stop times
    SmarterCSV.process(File.join(Rails.root, '/tmp/grt_temp/stop_times.txt')) do |chunk|
      chunk.each do |h| 
        obj = VehicleStopTime.new
        obj.departure_time = h[:departure_time]
        obj.vehicle_stop_id = h[:stop_id]
        obj.trip_id = h[:trip_id]
        obj.sequence = h[:stop_sequence]
        obj.save()
        
        puts h
      end
    end
  end

end
