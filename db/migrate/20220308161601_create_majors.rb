class CreateMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :majors do |t|
      t.string :name
      t.references :programme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
