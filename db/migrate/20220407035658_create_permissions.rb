class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.references :department, null: false, foreign_key: true
      t.references :permission_group, null: false, foreign_key: true
      t.boolean :can_create
      t.boolean :can_update
      t.boolean :can_discontinue
      t.boolean :can_view

      t.timestamps
    end
  end
end
