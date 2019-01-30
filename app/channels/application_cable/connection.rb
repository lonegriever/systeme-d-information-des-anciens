module ApplicationCable
    class Connection < ActionCable::Connection::Base
        include SessionsHelper

        identified_by :admin_user

        def connect
            self.admin_user = authenticate_admin_user
        end

        private

        def authenticate_admin_user
            if current_user.present? && current_user.is_an_admin
                current_user
            else
                reject_unauthorized_connection
            end
        end
    end
end
