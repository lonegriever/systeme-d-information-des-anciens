class Api::NotificationsController < ApplicationController
    include SessionsHelper
    def retrieve_all
        notifications_for = current_user.is_an_admin ? 'admins' : 'alumni'
        result = Services::Notification::RetrieveAll.invoke(params[:offset], notifications_for, current_user)
        render json: result, status: result[:status]
    end
end