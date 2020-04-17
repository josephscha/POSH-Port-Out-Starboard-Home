class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome]
    skip_before_action :get_current_user, only: [:new]
    def new 

    end
 
    def create 
        user = User.find_by(email: params[:session][:email])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user
        else 
            flash[:error] = "Email & Password combination invalid."
            redirect_back fallback_location: new_user_path
        end
    end

    def destroy
    #   byebug
        session.delete(:user_id)
        redirect_to login_path
    end

    def welcome
    
    end
end
