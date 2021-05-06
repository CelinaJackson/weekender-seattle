class Trip < ActiveRecord::Base 
    belongs_to :user 
    has_many :location
    accepts_nested_attributes_for :location
    has_many :comments 
    validates :title, presence: true 
    validates :content, presence: true 
end 