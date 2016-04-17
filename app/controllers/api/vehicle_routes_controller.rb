class Api::VehicleRoutesController < ApplicationController

  def index
    @vehicle_routes = VehicleRoute.paginate(:page => params[:page])
    
    render :json => {
      :current_page => @vehicle_routes.current_page,
      :per_page => @vehicle_routes.per_page,
      :total_entries => @vehicle_routes.total_entries,
      :entries => @vehicle_routes
    }
  end

  def show
    render :json => {
      :entry => VehicleRoute.find(params[:id])
    }
  end
end
