class AddSemesterToCourseRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :course_records, :semester, :integer, array: true
  end
end
