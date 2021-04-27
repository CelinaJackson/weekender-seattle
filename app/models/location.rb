class Location < ActiveRecord::Base 
    has_many :trips
    has_many :users, through: :trips
    validates :city, :state, :zipcode, presence: true
end