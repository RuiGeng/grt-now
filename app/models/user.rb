class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_favorite_routes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
            
     
  def self.from_auth(params, current_user)
    
    puts "params: #{params}"
    
    if current_user
      user = current_user
    elsif params[:email].present?
      user = User.find_or_initialize_by(email: params[:email])
    else
      user = User.new
    end
    
    first_name  = params[:first_name]
    last_name   = params[:last_name]
    
    #user.first_name    ||= (params[:first_name] || fallback_first_name)
    #user.last_name     ||= (params[:last_name]  || fallback_last_name)
    user.name = "#{first_name} #{last_name}"

    #if user.image_url.blank?
    #  user.image = Image.new(name: user.full_name, remote_file_url: params[:image_url])
    #end

    user.password = Devise.friendly_token[0,10] if user.encrypted_password.blank?
    
    # ignore default validation
    user.save(validate: false)

    # return user
    user
  end
end
