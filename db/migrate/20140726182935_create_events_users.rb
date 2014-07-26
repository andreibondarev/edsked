class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false
    end
  end
end
