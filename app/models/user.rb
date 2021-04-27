class User < ActiveRecord::Base 
    has_many :trips 
    has_many :locations, through: :trips 
    has_many :comments 
    validates :first_name, :last_name, :email, presence: true  
    validates :email, uniqueness: true 
    has_secure_password 
end 