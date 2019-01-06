class SessionsController < ApplicationController
    include SessionsHelper
    def new
    end

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            session[:user_id] = user.id
            redirect_user
        else
            flash.now.alert = 'Username or Passsord is incorrect'
            render :new
        end
    end

    def test
    end

    private

    def session_params
        params.permit(:username, :password)
    end

    def redirect_user
        if current_user.is_an_admin
            redirect_to admin_home_path
        else
            redirect_to root_url, notice: 'Log in successful!'
        end    
    end
end
