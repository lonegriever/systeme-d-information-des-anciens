class Event < ApplicationRecord
    belongs_to :user
    mount_uploader :file, FileUploader

    validates :caption, length: { minimum: 20, maximum: 1000 }
    validates :file, presence: true
end
