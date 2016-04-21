class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  validates :email, presence: true, length: { in: 3..50 },
            uniqueness: { case_sensitive: false },
            format: { with: Devise.email_regexp }, on: [:save]
  
  validates :password, presence: true, confirmation: true,
            length: { in: Devise.password_length }, on: [:save]
  
  validates :password_confirmation, :presence => true,
            length: { in: Devise.password_length }, on: [:save]
end
