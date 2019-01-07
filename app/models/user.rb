class User < ApplicationRecord
    has_secure_password
    has_many :events
    def is_an_admin
        self.admin
    end
end
