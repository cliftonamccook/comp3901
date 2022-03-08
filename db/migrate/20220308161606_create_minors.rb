class CreateMinors < ActiveRecord::Migration[6.1]
  def change
    create_table :minors do |t|
      t.string :name
      t.references :programme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
