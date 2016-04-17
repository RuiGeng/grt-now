class Api::VehicleTripsController < ApplicationController

  def index
    @vehicle_trips = VehicleTrip.paginate(:page => params[:page])
    
    render :json => {
      :current_page => @vehicle_trips.current_page,
      :per_page => @vehicle_trips.per_page,
      :total_entries => @vehicle_trips.total_entries,
      :entries => @vehicle_trips
    }
  end

  def show
    render :json => {
      :entry => VehicleTrip.find(params[:id])
    }
  end
end
