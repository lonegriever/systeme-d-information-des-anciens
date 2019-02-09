class Api::NotificationsController < ApplicationController
    def retrieve_all
        result = Services::Notification::RetrieveAll.invoke(params[:offset], params[:notifications_for])
        render json: result, status: result[:status]
    end
end