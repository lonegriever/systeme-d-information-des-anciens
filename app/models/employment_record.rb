class EmploymentRecord < ApplicationRecord
    belongs_to :alumnus_record

    validates_presence_of [
        :company_name,
        :position,
        :date_started
    ], if: :employed

    private
    
    def employed
        self.alumnus_record.employment_status == 'employed'
    end

end
