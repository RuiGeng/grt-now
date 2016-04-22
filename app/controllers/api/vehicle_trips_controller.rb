class Api::VehicleTripsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @vehicle_trips = VehicleTrip.paginate(:page => params[:page])
    
    render :json => {
      :current_page => @vehicle_trips.current_page,
      :per_page => @vehicle_trips.per_page,
      :total_entries => @vehicle_trips.total_entries,
      :entries => @vehicle_trips
    }
  end
  
  def search
    query = {}
    
    if(params[:vehicle_route_id])
      query["vehicle_route_id"] = params[:vehicle_route_id]
    end
    
    @vehicle_trips = VehicleTrip.where(query).paginate(:page => params[:page])
    
    #@.paginate(:page => params[:page])
    
    render :json => {
      :current_page => nil,
      :per_page => nil,
      :total_entries => nil,
      :entries => @vehicle_trips
    }
  end

  #def show
  #  render :json => {
  #    :entry => VehicleTrip.find(params[:id])
  #  }
  #end
end
