class Api::ChartsDataController < ApplicationController
    def get_alumni_statistics
        render json: {
            message: 'noice'
        }, status: :ok
    end
end