- bundle install
- rake db:migrate
- create a folder in /tmp/grt_temp
- download http://www.regionofwaterloo.ca/opendatadownloads/GRT_Merged_GTFS.zip and put all contents in that folder
- execute these tasks
- rake grtrobot:import_grt_routes
- rake grtrobot:import_grt_stops
- rake grtrobot:import_grt_trips
- rake grtrobot:import_grt_stop_times

----------

to create an admin user, register as a normal user at /users/sign_up and set isadmin=1 on the mysql user's table for that user. 

----------

to pull buses realtime data, use any of these options: 
- access the admin page /vehicle_realtimes/pull
- or execute: rake grtrobot:pull_real_time
