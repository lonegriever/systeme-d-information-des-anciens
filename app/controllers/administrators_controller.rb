class AdministratorsController < ApplicationController
    include SessionsHelper
    include Authenticatable
    before_action :check_if_user_is_logged_in
    before_action :check_if_user_is_an_admin
    QUERY_ARRAY = [:first_name, :last_name, :gender, :course, :year_graduated]
    def alumni_list
        set_session
        recs = build_query
        @alumnus_records = recs.order(:first_name).page params[:page]
    end

    def alumni_statistics
        
    end

    def show_alumnus_record
        @alumnus_record = AlumnusRecord.find_by(id: params[:id])
        @employment_record = @alumnus_record.employment_record
    end

    private

    def set_session
        permitted_params =  params.permit(
            :first_name,
            :last_name,
            :year_graduated,
            :gender,
            :course

        )
        permitted_params.each do |key, value|
            unless key == 'course'
                session[key.to_sym] = value.downcase
            else
                session[key.to_sym] = value
            end
        end
    end

    def build_query
        QUERY_ARRAY.each do |element|
            if session[element].nil? then session[element] = '' end
        end
        query_result =  AlumnusRecord.where("first_name LIKE ?", '%' + session[:first_name] + '%')
        .where("last_name LIKE ?", '%' + session[:last_name] + '%')
        .where(gender: session[:gender])
        .where('course LIKe ?', '%' + session[:course] + '%')
        if session[:year_graduated].present?
            query_result = query_result.where(year_graduated: session[:year_graduated])
        end
        query_result
    end
end
