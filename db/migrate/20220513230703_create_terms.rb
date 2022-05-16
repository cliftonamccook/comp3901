class CreateTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :terms do |t|
      t.string :start_year
      t.string :end_year

      t.timestamps
    end
  end
end
