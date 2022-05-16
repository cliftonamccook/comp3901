class UpdateCourseRecordSemester < ActiveRecord::Migration[6.1]
  def change
    remove_column :course_records, :semester
    add_column :course_records, :semester, :integer
  end
end
