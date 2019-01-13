class UsersController < ApplicationController
    include SessionsHelper

    def new
        @user = User.new
    end

    def create
        if @user.save
            log_user_in(@user)
            redirect_to events_path, notice: "Registration Successful"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
