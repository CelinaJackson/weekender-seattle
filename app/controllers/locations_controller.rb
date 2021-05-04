class LocationsController < ApplicationController
    def index 
        @locations = Location.all 
    end 

    def show 
        @location = Location.find(params[:id])
    end 

    def new 
        @location = Location.new(location_params)
    end 

    def create 
        if @location.valid? 
            @location.save 
            redirect_to location_path(@location)
        else 
            render :new
        end 
    end 

    def edit 
        @location = Location.find(params[:id])
    end 

    def update 
        if @location.update(location_params)
            redirect_to location_path(@location)
        else 
            render :edit 
        end
    end 

    def destroy 
    end 

    private 
    
    def location_params 
        params.require(:location).permit(:city, :state, :zipcode)
    end 
end 