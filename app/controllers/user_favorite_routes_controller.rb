class UserFavoriteRoutesController < ApplicationController
  before_action :set_user_favorite_route, only: [:show, :edit, :update, :destroy]

  # GET /user_favorite_routes
  # GET /user_favorite_routes.json
  def index
    @user_favorite_routes = UserFavoriteRoute.paginate(:page => params[:page], :per_page => 15)
    
    respond_to do |format|
      format.html { render :index }
      format.json {
        render :json => {
          :current_page => @user_favorite_routes.current_page,
          :per_page => @user_favorite_routes.per_page,
          :total_entries => @user_favorite_routes.total_entries,
          :entries => @user_favorite_routes
        }
      }
    end
  end

  # GET /user_favorite_routes/1
  # GET /user_favorite_routes/1.json
  def show
  end

  # GET /user_favorite_routes/new
  def new
    @user_favorite_route = UserFavoriteRoute.new
  end

  # GET /user_favorite_routes/1/edit
  def edit
  end

  # POST /user_favorite_routes
  # POST /user_favorite_routes.json
  def create
    @user_favorite_route = UserFavoriteRoute.new(user_favorite_route_params)

    respond_to do |format|
      if @user_favorite_route.save
        format.html { redirect_to @user_favorite_route, notice: 'User Favorite route was successfully created.' }
        format.json { render :show, status: :created, location: @user_favorite_route }
      else
        format.html { render :new }
        format.json { render json: @user_favorite_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favorite_routes/1
  # PATCH/PUT /user_favorite_routes/1.json
  def update
    respond_to do |format|
      if @user_favorite_route.update(user_favorite_route_params)
        format.html { redirect_to @user_favorite_route, notice: 'User Favorite route was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_favorite_route }
      else
        format.html { render :edit }
        format.json { render json: @user_favorite_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favorite_routes/1
  # DELETE /user_favorite_routes/1.json
  def destroy
    @user_favorite_route.destroy
    respond_to do |format|
      format.html { redirect_to user_favorite_routes_url, notice: 'User favorite route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favorite_route
      @user_favorite_route = UserFavoriteRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_favorite_route_params
      params.require(:user_favorite_route).permit(:user_id, :vehicle_route_id)
    end
end
