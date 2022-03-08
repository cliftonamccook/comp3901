class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.references :faculty, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
