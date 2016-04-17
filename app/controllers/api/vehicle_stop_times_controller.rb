class Api::VehicleStopTimesController < ApplicationController

  def index
    
    query = {}
    
    if(params[:vehicle_trip_id] && params[:vehicle_trip_id] != "")
      query["vehicle_trip_id"] = params[:vehicle_trip_id]
    end
    
    if(params[:vehicle_stop_id] && params[:vehicle_stop_id] != "")
      query["vehicle_stop_id"] = params[:vehicle_stop_id]
    end
    
    puts query
    
    @vehicle_stop_times = VehicleStopTime.where(query).paginate(:page => params[:page])
    
    render :json => {
      :current_page => @vehicle_stop_times.current_page,
      :per_page => @vehicle_stop_times.per_page,
      :total_entries => @vehicle_stop_times.total_entries,
      :entries => @vehicle_stop_times
    }, :include => [:vehicle_trip, :vehicle_stop]
  end
  
  def show
    render :json => {
      :entry => VehicleStopTime.find(params[:id])
    }, :include => [:vehicle_trip, :vehicle_stop]
  end
end
