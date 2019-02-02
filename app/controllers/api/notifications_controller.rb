class Api::NotificationsController < ApplicationController
    def retrieve_all
        result = Services::Notification::RetrieveAll.invoke(params[:offset])
        render json: result, status: result[:status]
    end
end