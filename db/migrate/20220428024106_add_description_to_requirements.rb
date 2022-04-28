class AddDescriptionToRequirements < ActiveRecord::Migration[6.1]
  def change
    add_column :requirements, :description, :text
  end
end
