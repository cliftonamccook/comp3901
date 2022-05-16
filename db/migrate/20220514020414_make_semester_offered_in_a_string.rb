class MakeSemesterOfferedInAString < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :semester_offered_in
    add_column :courses, :semester_offered_in, :string
  end
end
