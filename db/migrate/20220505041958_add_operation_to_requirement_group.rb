class AddOperationToRequirementGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :requirement_groups, :operation, :integer
  end
end
