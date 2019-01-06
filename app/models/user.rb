class User < ApplicationRecord
    has_secure_password

    def is_an_admin
        self.admin
    end
end
