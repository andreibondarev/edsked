class AddUserFields < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :first_name, :string, null: false
      t.column :last_name, :string, null: false
      t.column :role, :integer, default: 0
      t.column :organization_id, :integer, null: false
    end
  end
end
