class AddUserToPermissionGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :permission_groups, :user, null: true, foreign_key: true
  end
end
