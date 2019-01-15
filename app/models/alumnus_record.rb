class AlumnusRecord < ApplicationRecord
    belongs_to :user, optional: true
    has_one :employment_record
    accepts_nested_attributes_for :employment_record

    def full_name
        "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end
end
