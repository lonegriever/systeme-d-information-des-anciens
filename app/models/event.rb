class Event < ApplicationRecord
    belongs_to :user
    mount_uploader :file, FileUploader

    validates :caption, length: { minimum: 20, maximum: 200 }
    validates :file, presence: true
end
