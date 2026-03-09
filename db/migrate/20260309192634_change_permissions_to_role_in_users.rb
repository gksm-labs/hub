class ChangePermissionsToRoleInUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :permissions, :integer
    add_column :users, :role, :string, default: "student", null: false
    add_index :users, :role
  end
end
