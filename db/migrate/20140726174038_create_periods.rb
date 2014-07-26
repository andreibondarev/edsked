class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :period_name
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
