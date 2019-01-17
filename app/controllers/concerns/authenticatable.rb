module Authenticatable
    private

    def check_if_user_is_an_admin
        unless current_user.is_an_admin
            redirect_to events_path
        end
    end

    def check_if_user_is_logged_in
        unless current_user.present?
            flash.alert = 'You have to login first to continue'
            redirect_to login_path
        end
    end
end