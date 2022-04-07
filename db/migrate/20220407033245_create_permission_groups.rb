class CreatePermissionGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
