class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :category, index: true
      t.integer :guide_id
      t.string :title
      t.string :description
      t.float :average_score
      t.boolean :published, default: false

      t.timestamps null: false
    end
    add_foreign_key :tours, :categories
  end
end
