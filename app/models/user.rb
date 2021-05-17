class User < ActiveRecord::Base 
    has_many :trips 
    has_many :locations, through: :trips 
    has_many :comments 
    validates :first_name, :last_name, :email, presence: true  
    validates :email, uniqueness: true
    has_secure_password 
    validates :password_digest, presence: true 

    devise  :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable, :lockable, :timeoutable,
    :omniauthable, omniauth_providers: [:google_oauth2]

    def self.create_from_provider_data(provider_data)
        where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
          user.email = provider_data.info.email
          user.password = Devise.friendly_token[0, 20]
          user.skip_confirmation!
        end
    end
end 