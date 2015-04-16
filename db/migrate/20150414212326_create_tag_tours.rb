class CreateTagTours < ActiveRecord::Migration
  def change
    create_table :tag_tours do |t|
      t.references :tag, index: true
      t.references :tour, index: true

      t.timestamps null: false
    end
    add_foreign_key :tag_tours, :tags
    add_foreign_key :tag_tours, :tours
  end
end
