class CreateTagSuggestions < ActiveRecord::Migration
  def change
    create_table :tag_suggestions do |t|
      t.string :term
      t.integer :popularity

      t.timestamps null: false
    end
  end
end
