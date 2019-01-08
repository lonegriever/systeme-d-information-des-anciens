class SessionsController < ApplicationController
    include SessionsHelper

    def new
    end

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            
            cookies.permanent[:authentication_token] = user.authentication_token
            redirect_user
        else
            flash.now.alert = 'Username or Passsord is incorrect'
            render :new
        end
    end

    def destroy
        cookies.delete(:authentication_token)
        redirect_to login_path, notice: 'Logged out!'
    end

    def test
    end

    private

    def session_params
        params.permit(:username, :password)
    end

    def redirect_user
        if current_user.is_an_admin
            redirect_to new_event_path
        else
            redirect_to root_url, notice: 'Log in successful!'
        end    
    end
end
