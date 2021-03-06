class UsersController < ApplicationController 
    def index 
        @users = User.all
    end 

    def show 
        @user = User.find_by(params[:id])
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else 
            render :new 
        end
    end 

    private 

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 
end 