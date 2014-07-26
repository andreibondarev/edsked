class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :event_type, :integer, null: false
      t.column :event_date, :date, null: false
      t.column :period_id, :integer, null: false

      t.timestamps
    end
  end
end
