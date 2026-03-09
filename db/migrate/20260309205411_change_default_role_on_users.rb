class ChangeDefaultRoleOnUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :role, from: "student", to: "user"
  end
end
