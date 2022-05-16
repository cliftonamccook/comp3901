class AddTermToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :programmes, :term_id, :integer
    add_column :majors, :term_id, :integer    
    add_column :minors, :term_id, :integer
    add_column :courses, :term_id, :integer                
  end
end
