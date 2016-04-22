class Api::VehicleRealtimesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @vehicle_realtimes = VehicleRealtime.all
    
    render :json => {
      :current_page => nil,
      :per_page => nil,
      :total_entries => nil,
      :entries =>  @vehicle_realtimes
    }, :include => [:vehicle_trip, :vehicle_route, :vehicle_stop]
  end

  def show
    render :json => {
      :entry => VehicleRealtime.find(params[:id])
    }, :include => [:vehicle_trip, :vehicle_route, :vehicle_stop]
  end
end
