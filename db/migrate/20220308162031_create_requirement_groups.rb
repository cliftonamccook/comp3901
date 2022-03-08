class CreateRequirementGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :requirement_groups do |t|
      t.string :name
      t.references :requirement_groupable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
