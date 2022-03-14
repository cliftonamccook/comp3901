class AddUwiidToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uwi_id, :integer
  end
end
