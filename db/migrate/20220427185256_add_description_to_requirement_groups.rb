class AddDescriptionToRequirementGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :requirement_groups, :description, :text
  end
end
