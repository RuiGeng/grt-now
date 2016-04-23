class VehicleRoutesController < ApplicationController
  before_action :is_admin, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_vehicle_route, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_routes
  # GET /vehicle_routes.json
  def index
    @vehicle_routes = VehicleRoute.paginate(:page => params[:page], :per_page => 15)
    
    respond_to do |format|
      format.html { render :index }
      format.json {
        render :json => {
          :current_page => @vehicle_routes.current_page,
          :per_page => @vehicle_routes.per_page,
          :total_entries => @vehicle_routes.total_entries,
          :entries => @vehicle_routes
        }
      }
    end
  end

  # GET /vehicle_routes/1
  # GET /vehicle_routes/1.json
  def show
  end

  # GET /vehicle_routes/new
  # def new
  #   @vehicle_route = VehicleRoute.new
  # end

  # GET /vehicle_routes/1/edit
  def edit
  end

  # POST /vehicle_routes
  # POST /vehicle_routes.json
  def create
    @vehicle_route = VehicleRoute.new(vehicle_route_params)

    respond_to do |format|
      if @vehicle_route.save
        format.html { redirect_to @vehicle_route, notice: 'Vehicle route was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_route }
      else
        format.html { render :new }
        format.json { render json: @vehicle_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_routes/1
  # PATCH/PUT /vehicle_routes/1.json
  def update
    respond_to do |format|
      if @vehicle_route.update(vehicle_route_params)
        format.html { redirect_to vehicle_routes_path, notice: 'Vehicle route was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_route }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_routes/1
  # DELETE /vehicle_routes/1.json
  def destroy
    @vehicle_route.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_routes_url, notice: 'Vehicle route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_route
      @vehicle_route = VehicleRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_route_params
      params.require(:vehicle_route).permit(:long_name)
    end
    
    def is_admin
      if current_user && !current_user.isadmin
        redirect_to root_url
      end
    end
end
