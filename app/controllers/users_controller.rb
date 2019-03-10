class UsersController < ApplicationController
    include SessionsHelper

    before_action :set_user, only:[:edit, :update]
    def new
        @user = User.new
        @user.build_alumnus_record
        @user.alumnus_record.build_employment_record
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_user_in(@user)
            redirect_to events_path, notice: "Registration Successful"
        else
            render :new
        end
    end

    def about
    end

    def edit
    end

    def update
        if @alumnus_record.update(alumnus_record_params)
            redirect_to show_alumnus_record_path(@alumnus_record.id), notice: "The record has been successfully updated."
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(
                :username,
                :password,
                alumnus_record_attributes: [
                    :id,
                    :user_id,
                    :first_name,
                    :last_name,
                    :email,
                    :gender,
                    :birth_date,
                    :course,
                    :year_graduated,
                    :employment_status,
                    :reason_for_unemployment,
                    employment_record_attributes: [
                        :id,
                        :alumnus_record_id,
                        :company_name,
                        :position,
                        :date_started
                    ]
                ]
            )
    end

    def alumnus_record_params
        params.require(:alumnus_record).permit(
            :id,
            :user_id,
            :first_name,
            :last_name,
            :email,
            :gender,
            :birth_date,
            :course,
            :year_graduated,
            :employment_status,
            :reason_for_unemployment,
            employment_record_attributes: [
                :id,
                :alumnus_record_id,
                :company_name,
                :position,
                :date_started
            ]
        )
    end

    def set_user
        @alumnus_record = AlumnusRecord.find_by(id:params[:user_id])
    end
end
