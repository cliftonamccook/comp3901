class Schemaupdate < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :requirement_id
    add_column :requirements, :course_ids, :bigint, array: true
  end
end
