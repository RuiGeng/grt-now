class Api::UsersController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :set_current_user

  def index
    render json: @current_user || nil
  end
  
  private 
    def set_current_user
        token = request.headers['Authorization'].to_s.split(' ').last
        return unless token
    
        payload = Token.new(token)
    
        @current_user = User.find(payload.user_id) if payload.valid?
    end

end