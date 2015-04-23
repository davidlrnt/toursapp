class CreateGuideratings < ActiveRecord::Migration
  def change
    create_table :guideratings do |t|
      t.references :guide, index: true
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :guideratings, :guides
  end
end
