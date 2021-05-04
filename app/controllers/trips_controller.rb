class TripsController < ApplicationController 
    def index 
        if params[:user_id]
            @trips = User.find(params[:user_id]).trips 
        else 
            @trips = Trip.all
        end 
    end 

    def show
        @trip = Trip.find_by(params[:id]) 
    end 

    def new 
        @trip = Trip.new(trip_params)
    end 

    def create 
        @trip = Trip.create(trip_params)
        if  @trip.save 
            redirect_to trip_path(@trip)
        else 
            render :new 
        end 
    end 

    def edit 
        @trip = Trip.find_by(params[:id])
    end 
    
    def update 
        if @trip.update(trip_params)
            redirect_to trip_path(@trip)
        else 
            render :edit 
        end
    end 

    def destroy 
    end 

    private 

    def trip_params 
        params.permit(:title, :content, location_attributes: [:city, :state, :zipcode])
    end 

end 