class CreateFaculties < ActiveRecord::Migration[6.1]
  def change
    create_table :faculties do |t|
      t.references :campus, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
