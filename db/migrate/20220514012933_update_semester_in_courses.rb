class UpdateSemesterInCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :semester_offered_in, :string
    add_column :courses, :semester_offered_in, :string, array: true
  end
end
