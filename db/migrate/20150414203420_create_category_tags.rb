class CreateCategoryTags < ActiveRecord::Migration
  def change
    create_table :category_tags do |t|
      t.references :tag, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :category_tags, :tags
    add_foreign_key :category_tags, :categories
  end
end
