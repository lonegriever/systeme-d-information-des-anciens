class EmploymentRecord < ApplicationRecord
    belongs_to :alumnus_record

    validates_presence_of [
        :company_name,
        :position,
        :date_started,
        :salary
    ], if: :employed

    validates :salary, numericality: {greater_than_or_equal_to: 6000}

    private
    
    def employed
        self.alumnus_record.employment_status == 'employed'
    end

end
