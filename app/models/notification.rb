class Notification < ApplicationRecord
  belongs_to :user

  scope :unread_count, -> { where(is_read: false).count }
end
