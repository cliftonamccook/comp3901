class CreateCourseRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :course_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :grade
      t.integer :term

      t.timestamps
    end
  end
end
