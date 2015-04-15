class CreateCityTours < ActiveRecord::Migration
  def change
    create_table :city_tours do |t|
      t.references :city, index: true
      t.references :tour, index: true

      t.timestamps null: false
    end
    add_foreign_key :city_tours, :cities
    add_foreign_key :city_tours, :tours
  end
end
