class Api::NotificationsController < ApplicationController
    def retrieve_all
        render json: {message: 'noice'}, status: :ok
    end
end