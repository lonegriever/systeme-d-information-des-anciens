class Notification < ApplicationRecord
  belongs_to :user

    scope :notifications_for_admins, -> { where.not(notification_type: 'event-creation') }
    scope :notifications_for_users, -> { where(notification_type: 'event-creation')}
end
