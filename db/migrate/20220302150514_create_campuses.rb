class CreateCampuses < ActiveRecord::Migration[6.1]
  def change
    create_table :campuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
