class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :category, index: true
      t.string :title
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :tours, :categories
  end
end
