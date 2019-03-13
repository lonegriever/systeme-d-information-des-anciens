class AddIsVerifiedToAlumnusRecord < ActiveRecord::Migration[5.2]
    def change
        add_column :alumnus_records, :is_verified, :boolean, default: false
    end
end
