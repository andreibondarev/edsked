class CreateUsersPeriods < ActiveRecord::Migration
  def change
    create_table :users_periods do |t|
      t.references :user, null:false, index: true
      t.references :period, null:false, index: true
      t.boolean :is_planning

      t.timestamps
    end
  end
end
