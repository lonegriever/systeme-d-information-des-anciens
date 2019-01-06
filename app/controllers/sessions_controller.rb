class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            session[:user_id] = user.id
            redirect_to root_url, notice: 'Log in successful!'
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
end
