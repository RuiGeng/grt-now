class VehicleRealtimesController < ApplicationController
  before_action :set_vehicle_realtime, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_realtimes
  # GET /vehicle_realtimes.json
  def index
    @vehicle_realtimes = VehicleRealtime.all
  end

  # GET /vehicle_realtimes/1
  # GET /vehicle_realtimes/1.json
  def show
  end

  # GET /vehicle_realtimes/new
  def new
    @vehicle_realtime = VehicleRealtime.new
  end

  # GET /vehicle_realtimes/pull
  def pull
    VehicleRealtime.pull_real_time()
    
    respond_to do |format|
      format.html { redirect_to vehicle_realtimes_url, notice: 'Vehicle realtime was successfully updated.' }
      format.json {
        render :json => {
          message: 'success'
        }
      }
    end
  end

  # GET /vehicle_realtimes/1/edit
  def edit
  end

  # POST /vehicle_realtimes
  # POST /vehicle_realtimes.json
  def create
    @vehicle_realtime = VehicleRealtime.new(vehicle_realtime_params)

    respond_to do |format|
      if @vehicle_realtime.save
        format.html { redirect_to @vehicle_realtime, notice: 'Vehicle realtime was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_realtime }
      else
        format.html { render :new }
        format.json { render json: @vehicle_realtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_realtimes/1
  # PATCH/PUT /vehicle_realtimes/1.json
  def update
    respond_to do |format|
      if @vehicle_realtime.update(vehicle_realtime_params)
        format.html { redirect_to @vehicle_realtime, notice: 'Vehicle realtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_realtime }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_realtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_realtimes/1
  # DELETE /vehicle_realtimes/1.json
  def destroy
    @vehicle_realtime.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_realtimes_url, notice: 'Vehicle realtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_realtime
      @vehicle_realtime = VehicleRealtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_realtime_params
      params.require(:vehicle_realtime).permit(:vehicle_trip_id, :vehicle_route_id, :vehicle_stop_id, :current_status, :lat, :long)
    end
end
