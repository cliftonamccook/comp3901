class RemoveDepartmentAssociationFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :department_id
  end
end
