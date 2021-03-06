class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_one :alumnus_record, dependent: :destroy
    accepts_nested_attributes_for :alumnus_record
    validates :username, uniqueness: true
    
    before_create { generate_authentication_token(:authentication_token) }
    before_save { self.username = self.username.downcase }
    
    def is_an_admin
        self.admin
    end

    def generate_authentication_token column
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.find_by(column => self[column])
    end
end
