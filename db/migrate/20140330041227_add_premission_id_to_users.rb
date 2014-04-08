class AddPremissionIdToUsers < ActiveRecord::Migration
  add_column :users, :permission_id, :integer, default: 1, null: false
  add_index :users, :permission_id
end
