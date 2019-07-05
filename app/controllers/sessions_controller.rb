class SessionsController < ApplicationController

    def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path
    end

    def logout
        redirect_to destroy_user_session_path
    end 
end