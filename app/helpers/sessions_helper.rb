module SessionsHelper
    def current_user
        @current_user ||= User.find_by(
            authentication_token: cookies[:authentication_token]) if cookies[:authentication_token]
    end
end
