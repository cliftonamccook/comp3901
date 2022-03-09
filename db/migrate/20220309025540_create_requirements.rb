class CreateRequirements < ActiveRecord::Migration[6.1]
  def change
    create_table :requirements do |t|
      t.references :requirement_group, null: false, foreign_key: true
      t.integer :operation
      t.integer :minimum_amount_of_credits

      t.timestamps
    end
  end
end
