class ApplicationController < ActionController::Base
    helper_method :current_user
    protect_from_forgery with: :exception
    before_action :login_required
    skip_before_action :login_required, only: [:new, :create]

    def login_required
        if !logged_in? 
            redirect_to new_session_path, :notice => "Log in to edit or delete your ratings"
        end 
    end 

    def logged_in?
        !current_user.nil?
    end 

    helper_method :logged_in?
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
end
