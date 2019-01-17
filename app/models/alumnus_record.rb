class AlumnusRecord < ApplicationRecord
    belongs_to :user, optional: true
    has_one :employment_record, dependent: :destroy
    accepts_nested_attributes_for :employment_record

    before_create :down_case_attributes
    def full_name
        "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end

    paginates_per 5

    private

    def down_case_attributes
        attributes.each do |attr_name, attr_value|
            if attr_value.class == String
                unless attr_name == 'course' || attr_name == 'reason_for_unemployment'
                    self[attr_name.to_sym] = attr_value.downcase
                end
            end
        end
    end
end
