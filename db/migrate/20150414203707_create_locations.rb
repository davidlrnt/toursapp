class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :long
      t.string :lat
      t.integer :step

      t.timestamps null: false
    end
  end
end
