class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  require 'jwt'
  
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        
        #render :nothing => true, :status => 200, :content_type => 'text/html'
       # render_success(token: Token.encode(@user.id), id: @user.id)
        #render json: { token: Token.encode(@user.id) }
        #render plain: omniauth_params
        #redirect_to auth_origin_url
        redirect_to "http://localhost:9000/?code=" + params['code'] + "&session_state=" + params['state'] + "&prompt=none"
        # redirect_to DeviseTokenAuth::Url.generate("http://localhost:9000", {code: params['code'], authuser: @user.id, session_state: params['state'], prompt: 'none'})
    #    sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        render plain: 1
   #     redirect_to new_user_registration_url
      end
  end

  def render_success(data, status = :ok)
    if data.is_a? String
      render_data({ message: data }, status)
    else
      render_data(data, status)
    end
  end
  
  def render_data(data, status)
    render json: data, status: status, callback: params[:callback]
  end

  def render_error(message, status = :unprocessable_entity)
    render_data({ error: message }, status)
  end
  
  def auth_origin_url
    omniauth_params['auth_origin_url'] || omniauth_params['origin']
  end  
  
  def omniauth_params
      if !defined?(@_omniauth_params)
        if request.env['omniauth.params'] && request.env['omniauth.params'].any?
          @_omniauth_params = request.env['omniauth.params']
        elsif session['dta.omniauth.params'] && session['dta.omniauth.params'].any?
          @_omniauth_params ||= session.delete('dta.omniauth.params')
          @_omniauth_params
        elsif params['omniauth_window_type']
          @_omniauth_params = params.slice('omniauth_window_type', 'auth_origin_url', 'resource_class', 'origin')
        else
          @_omniauth_params = {}
        end
      end
      @_omniauth_params

    end
end