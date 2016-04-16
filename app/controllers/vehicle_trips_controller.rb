class VehicleTripsController < ApplicationController
  before_action :set_vehicle_trip, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_trips
  # GET /vehicle_trips.json
  def index
    @vehicle_trips = VehicleTrip.all
  end

  # GET /vehicle_trips/1
  # GET /vehicle_trips/1.json
  def show
  end

  # GET /vehicle_trips/new
  def new
    @vehicle_trip = VehicleTrip.new
  end

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
        format.html { redirect_to @vehicle_trip, notice: 'Vehicle trip was successfully updated.' }
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
end
