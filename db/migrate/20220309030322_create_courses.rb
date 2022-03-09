class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.text :description
      t.integer :credit_amount
      t.integer :level
      t.integer :semester_offered_in
      t.boolean :discountinued, default: false
      t.references :department, null: false, foreign_key: true
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
