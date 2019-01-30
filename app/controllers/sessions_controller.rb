class SessionsController < ApplicationController
    include SessionsHelper
    before_action :check_user_cookies, only: [:new]

    def new
    end

    def create
        user = User.find_by(username: session_params[:username])
        if user && user.authenticate(session_params[:password])
            log_user_in(user)
            create_and_broadcast_notification(user)
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

    private

    def session_params
        params.permit(:username, :password)
    end

    def check_user_cookies
        if current_user.present?
            redirect_to events_path
        end
    end

    def redirect_user
        if current_user.is_an_admin
            redirect_to new_event_path
        else
            redirect_to root_url, notice: 'Log in successful!'
        end    
    end

    def create_and_broadcast_notification(user)
        ActionCable.server.broadcast 'admin_notifications_channel',
        {
            message: "A user has logged in.",
            username: user.username
        }
    end
end
