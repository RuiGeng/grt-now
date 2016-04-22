class UsersFavoriteRoutesController < ApplicationController
  before_action :set_users_favorite_route, only: [:show, :edit, :update, :destroy]

  # GET /users_favorite_routes
  # GET /users_favorite_routes.json
  def index
    @users_favorite_routes = UserFavoriteRoute.all
  end

  # GET /users_favorite_routes/1
  # GET /users_favorite_routes/1.json
  def show
  end

  # GET /users_favorite_routes/new
  def new
    @users_favorite_route = UserFavoriteRoute.new
  end

  # GET /users_favorite_routes/1/edit
  def edit
  end

  # POST /users_favorite_routes
  # POST /users_favorite_routes.json
  def create
    @users_favorite_route = UserFavoriteRoute.new(users_favorite_route_params)

    respond_to do |format|
      if @users_favorite_route.save
        format.html { redirect_to @users_favorite_route, notice: 'Users favorite route was successfully created.' }
        format.json { render :show, status: :created, location: @users_favorite_route }
      else
        format.html { render :new }
        format.json { render json: @users_favorite_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_favorite_routes/1
  # PATCH/PUT /users_favorite_routes/1.json
  def update
    respond_to do |format|
      if @users_favorite_route.update(users_favorite_route_params)
        format.html { redirect_to @users_favorite_route, notice: 'Users favorite route was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_favorite_route }
      else
        format.html { render :edit }
        format.json { render json: @users_favorite_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_favorite_routes/1
  # DELETE /users_favorite_routes/1.json
  def destroy
    @users_favorite_route.destroy
    respond_to do |format|
      format.html { redirect_to users_favorite_routes_url, notice: 'Users favorite route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_favorite_route
      @users_favorite_route = UserFavoriteRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_favorite_route_params
      params.require(:users_favorite_route).permit(:user_id, :vehicle_route_id)
    end
end
