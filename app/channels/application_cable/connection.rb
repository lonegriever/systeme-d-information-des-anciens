module ApplicationCable
    class Connection < ActionCable::Connection::Base
        include SessionsHelper

        identified_by :signed_in_user

        def connect
            self.signed_in_user = authenticate_admin_user
        end

        private

        def authenticate_admin_user
            if current_user.present?
                current_user
            else
                reject_unauthorized_connection
            end
        end
    end
end
