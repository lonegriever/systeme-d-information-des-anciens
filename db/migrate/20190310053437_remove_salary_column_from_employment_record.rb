class RemoveSalaryColumnFromEmploymentRecord < ActiveRecord::Migration[5.2]
    def change
        remove_column :employment_records, :salary
    end
end
