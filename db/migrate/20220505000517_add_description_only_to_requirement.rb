class AddDescriptionOnlyToRequirement < ActiveRecord::Migration[6.1]
  def change
    add_column :requirements, :description_only, :boolean
  end
end
