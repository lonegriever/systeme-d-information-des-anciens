class EventChangeStringToText < ActiveRecord::Migration[5.2]
    def change
        change_column :events, :caption, :text
    end
end
