class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :country, index: true
      t.string :name
      t.string :image
      t.string :accent
      t.string :region
      t.float :lat
      t.float :long
      t.timestamps null: false
    end
    add_foreign_key :cities, :countries
  end
end
