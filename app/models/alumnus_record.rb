class AlumnusRecord < ApplicationRecord
    belongs_to :user, optional: true

    def full_name
        "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end
end
