class UpdatePermissionGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :permission_group_id, :bigint
    remove_column :permission_groups, :user_id
  end
end
