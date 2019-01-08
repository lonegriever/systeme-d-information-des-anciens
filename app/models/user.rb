class User < ApplicationRecord
    has_secure_password
    has_many :events
    validates :username, uniqueness: true
    
    before_create { generate_token(:authentication_token) }
    before_save { self.username = self.username.downcase }
    
    def is_an_admin
        self.admin
    end

    def generate_authentication_token column
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column: self[column])
    end
end
