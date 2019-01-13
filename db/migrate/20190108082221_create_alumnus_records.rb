class CreateAlumnusRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnus_records do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.date :birth_date
      t.string :course
      t.integer :year_graduated
      t.string :employment_status
      t.text :reason_for_unemployment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
