class CreateStudentProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_progresses do |t|
      t.text :report
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
