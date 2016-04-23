class Api::UsersFavoriteRoutesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :set_current_user

  def index
    if @current_user
        @vehicle_routes = UserFavoriteRoute.where(:user_id => @current_user.id).paginate(:page => params[:page], :per_page => 10)
        
        render :json => {
          :current_page => @vehicle_routes.current_page,
          :per_page => @vehicle_routes.per_page,
          :total_entries => @vehicle_routes.total_entries,
          :entries => @vehicle_routes
        }
    else
        render json: nil
    end
  end
  
  def create
    if @current_user
        @user_favorite_route = UserFavoriteRoute.new(user_favorite_route_params)
        @user_favorite_route.user_id = @current_user.id
    
      if @user_favorite_route.save
        render json: { status: :created, route: @user_favorite_route }
      else
        render json: { status: :unprocessable_entity }
      end
    end
  end  
  
  private 
    def set_current_user
        token = request.headers['Authorization'].to_s.split(' ').last
        return unless token
    
        payload = Token.new(token)
    
        @current_user = User.find(payload.user_id) if payload.valid?
    end
    
    def user_favorite_route_params
      params.require(:user_favorite_route).permit(:vehicle_route_id)
    end

end