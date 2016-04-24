class Api::VehicleRoutesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @vehicle_routes = VehicleRoute.all
    
    render :json => {
      :current_page => nil,
      :per_page => nil,
      :total_entries => nil,
      :entries => @vehicle_routes
    }
  end

  def show
    render :json => {
      :entry => VehicleRoute.find(params[:id])
    }
  end
end
