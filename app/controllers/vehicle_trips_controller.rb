class VehicleTripsController < ApplicationController
  before_action :is_admin, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_vehicle_trip, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_trips
  # GET /vehicle_trips.json
  def index
    @vehicle_trips = VehicleTrip.paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html { render :index }
      format.json {
        render :json => {
          :current_page => @vehicle_trips.current_page,
          :per_page => @vehicle_trips.per_page,
          :total_entries => @vehicle_trips.total_entries,
          :entries => @vehicle_trips
        }
      }
    end
  end

  # GET /vehicle_trips/1
  # GET /vehicle_trips/1.json
  def show
  end

  # GET /vehicle_trips/new
  # def new
  #   @vehicle_trip = VehicleTrip.new
  # end

  # GET /vehicle_trips/1/edit
  def edit
  end

  # POST /vehicle_trips
  # POST /vehicle_trips.json
  def create
    @vehicle_trip = VehicleTrip.new(vehicle_trip_params)

    respond_to do |format|
      if @vehicle_trip.save
        format.html { redirect_to @vehicle_trip, notice: 'Vehicle trip was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_trip }
      else
        format.html { render :new }
        format.json { render json: @vehicle_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_trips/1
  # PATCH/PUT /vehicle_trips/1.json
  def update
    respond_to do |format|
      if @vehicle_trip.update(vehicle_trip_params)
        format.html { redirect_to vehicle_trips_path, notice: 'Vehicle trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_trip }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_trips/1
  # DELETE /vehicle_trips/1.json
  def destroy
    @vehicle_trip.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_trips_url, notice: 'Vehicle trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_trip
      @vehicle_trip = VehicleTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_trip_params
      params.require(:vehicle_trip).permit(:vehicle_route_id, :service, :name, :direction)
    end
    
    def is_admin
      if current_user && !current_user.isadmin
        redirect_to root_url
      end
    end
end
