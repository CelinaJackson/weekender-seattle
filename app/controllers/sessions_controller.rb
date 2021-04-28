class SessionsController < ApplicationController 
    def new 
    end 

    def create 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:alert] = "Email or Password you entered was invalid."
            redirect_to new_session_path
        end 
    end 

    def omniauth 
    end 

    def destroy 
        session.delete :user_id
        redirect_to root_path 
    end 

    private 

    def auth 
    end 
end 