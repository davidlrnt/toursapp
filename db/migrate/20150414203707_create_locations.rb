class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :address
      t.string :lat
      t.string :lng
      t.integer :step

      t.timestamps null: false
    end
  end
end
