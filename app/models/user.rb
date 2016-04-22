class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
          
  include DeviseTokenAuth::Concerns::User
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]    
         
         
         
 def self.from_auth(params, current_user)
    #params = params.smash.with_indifferent_access
        
      if current_user
        user = current_user
      elsif params[:email].present?
        user = User.find_or_initialize_by(email: params[:email])
      else
        user = User.new
      end
    
    #authorization.secret = params[:secret]
    #authorization.token  = params[:token]
    
    fallback_name        = params[:name].split(" ") if params[:name]
    fallback_first_name  = fallback_name.try(:first)
    fallback_last_name   = fallback_name.try(:last)
    
    #user.first_name    ||= (params[:first_name] || fallback_first_name)
    #user.last_name     ||= (params[:last_name]  || fallback_last_name)

    #if user.image_url.blank?
    #  user.image = Image.new(name: user.full_name, remote_file_url: params[:image_url])
    #end

    user.password = Devise.friendly_token[0,10] if user.encrypted_password.blank?

    if user.email.blank?
      user.save(validate: false)
    else
      user.save
    end
    #authorization.user_id ||= user.id
    #authorization.save
    user
  end
         
 def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
         user = User.create(name: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20]
         )
    end
    
    user
  end
         
end
