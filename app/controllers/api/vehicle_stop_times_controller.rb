class Api::VehicleStopTimesController < ApplicationController

  def index
    @vehicle_stop_times = VehicleStopTime.paginate(:page => params[:page])
    
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
