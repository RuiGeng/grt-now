class VehicleStopTimesController < ApplicationController
  before_action :set_vehicle_stop_time, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_stop_times
  # GET /vehicle_stop_times.json
  def index
    @vehicle_stop_times = VehicleStopTime.paginate(:page => params[:page])
    
    respond_to do |format|
      format.html { render :index }
      format.json {
        render :json => {
          :current_page => @vehicle_stop_times.current_page,
          :per_page => @vehicle_stop_times.per_page,
          :total_entries => @vehicle_stop_times.total_entries,
          :entries => @vehicle_stop_times
        }
      }
    end
  end

  # GET /vehicle_stop_times/1
  # GET /vehicle_stop_times/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @vehicle_stop_time.to_json(:include => [:vehicle_trip, :vehicle_stop]) }
    end
  end

  # GET /vehicle_stop_times/new
  def new
    @vehicle_stop_time = VehicleStopTime.new
  end

  # GET /vehicle_stop_times/1/edit
  def edit
  end

  # POST /vehicle_stop_times
  # POST /vehicle_stop_times.json
  def create
    @vehicle_stop_time = VehicleStopTime.new(vehicle_stop_time_params)

    respond_to do |format|
      if @vehicle_stop_time.save
        format.html { redirect_to @vehicle_stop_time, notice: 'Vehicle stop time was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_stop_time }
      else
        format.html { render :new }
        format.json { render json: @vehicle_stop_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_stop_times/1
  # PATCH/PUT /vehicle_stop_times/1.json
  def update
    respond_to do |format|
      if @vehicle_stop_time.update(vehicle_stop_time_params)
        format.html { redirect_to @vehicle_stop_time, notice: 'Vehicle stop time was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_stop_time }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_stop_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_stop_times/1
  # DELETE /vehicle_stop_times/1.json
  def destroy
    @vehicle_stop_time.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_stop_times_url, notice: 'Vehicle stop time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_stop_time
      @vehicle_stop_time = VehicleStopTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_stop_time_params
      params.require(:vehicle_stop_time).permit(:departure_time, :vehicle_stop_id, :vehicle_trip_id, :sequence)
    end
end
