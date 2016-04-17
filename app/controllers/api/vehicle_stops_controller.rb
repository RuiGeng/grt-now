class Api::VehicleStopsController < ApplicationController

  def index
    @vehicle_stops = VehicleStop.all#.paginate(:page => params[:page])
    
    render :json => {
      :current_page => nil,
      :per_page => nil,
      :total_entries => nil,
      :entries => @vehicle_stops
    }
  end

  def show
    render :json => {
      :entry => VehicleStop.find(params[:id])
    }
  end
end
