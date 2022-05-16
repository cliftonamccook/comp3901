class RenameTermToTermIdInCourseRecords < ActiveRecord::Migration[6.1]
  def change
    rename_column :course_records, :term, :term_id
  end
end
