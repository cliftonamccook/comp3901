class AddDefaultValueToAccountStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :account_status, :integer, default: 0
  end
end
