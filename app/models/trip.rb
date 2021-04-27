class Trip < ActiveRecord::Base 
    belongs_to :user 
    has_one :location
    accepts_nested_attributes_for :location
    has_many :comments 
    validates :title, :location, :content, presence: true 
end 