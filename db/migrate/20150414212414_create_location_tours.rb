class CreateLocationTours < ActiveRecord::Migration
  def change
    create_table :location_tours do |t|
      t.references :tour, index: true
      t.references :location, index: true

      t.timestamps null: false
    end
    add_foreign_key :location_tours, :tours
    add_foreign_key :location_tours, :locations
  end
end
