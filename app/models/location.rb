class Location < ActiveRecord::Base 
    attr_accessor :city, :state, :zipcode
    has_many :trips
    has_many :users, through: :trips
    validates :city, :state, :zipcode, presence: true
    validates :zipcode, numericality: { only_integer: true }
    validates :zipcode, length: { is: 5 }
end