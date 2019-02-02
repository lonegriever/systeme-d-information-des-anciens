class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.boolean :is_read, default:  false
      t.string :notification_details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
