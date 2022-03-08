class CreateProgrammes < ActiveRecord::Migration[6.1]
  def change
    create_table :programmes do |t|
      t.string :name
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
