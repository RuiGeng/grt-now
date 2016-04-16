class VehicleStopsController < ApplicationController
  before_action :set_vehicle_stop, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_stops
  # GET /vehicle_stops.json
  def index
    @vehicle_stops = VehicleStop.paginate(:page => params[:page])
    
    respond_to do |format|
      format.html { render :index }
      format.json {
        render :json => {
          :current_page => @vehicle_stops.current_page,
          :per_page => @vehicle_stops.per_page,
          :total_entries => @vehicle_stops.total_entries,
          :entries => @vehicle_stops
        }
      }
    end
  end

  # GET /vehicle_stops/1
  # GET /vehicle_stops/1.json
  def show
  end

  # GET /vehicle_stops/new
  def new
    @vehicle_stop = VehicleStop.new
  end

  # GET /vehicle_stops/1/edit
  def edit
  end

  # POST /vehicle_stops
  # POST /vehicle_stops.json
  def create
    @vehicle_stop = VehicleStop.new(vehicle_stop_params)

    respond_to do |format|
      if @vehicle_stop.save
        format.html { redirect_to @vehicle_stop, notice: 'Vehicle stop was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_stop }
      else
        format.html { render :new }
        format.json { render json: @vehicle_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_stops/1
  # PATCH/PUT /vehicle_stops/1.json
  def update
    respond_to do |format|
      if @vehicle_stop.update(vehicle_stop_params)
        format.html { redirect_to @vehicle_stop, notice: 'Vehicle stop was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_stop }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_stops/1
  # DELETE /vehicle_stops/1.json
  def destroy
    @vehicle_stop.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_stops_url, notice: 'Vehicle stop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_stop
      @vehicle_stop = VehicleStop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_stop_params
      params.require(:vehicle_stop).permit(:name, :lat, :long)
    end
end
