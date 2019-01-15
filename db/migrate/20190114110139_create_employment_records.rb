class CreateEmploymentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :employment_records do |t|
      t.string :company_name
      t.string :position
      t.date :date_started
      t.decimal :salary
      t.references :alumnus_record, foreign_key: true

      t.timestamps
    end
  end
end
