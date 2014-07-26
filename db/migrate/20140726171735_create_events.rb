class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type, null: false
      t.datetime :event_date, null: false
      t.integer :period_id, null: false

      t.timestamps
    end
  end
end
