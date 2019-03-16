class Notification < ApplicationRecord
    belongs_to :user, optional: true, dependent: :destroy

    scope :notifications_for_admins, -> { where.not(notification_type: 'event-creation') }
    scope :notifications_for_users, -> { where(notification_type: 'event-creation')}
end
