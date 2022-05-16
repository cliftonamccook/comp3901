class AddProgrammeToStudentReport < ActiveRecord::Migration[6.1]
  def change
    add_column :student_progresses, :programme_id, :integer
    add_column :student_progresses, :major_id, :integer
    add_column :student_progresses, :minor_id, :integer
  end
end
