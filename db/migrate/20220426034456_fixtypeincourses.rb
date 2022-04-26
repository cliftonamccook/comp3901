class Fixtypeincourses < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :discountinued, :discontinued
  end
end
