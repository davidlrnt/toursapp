class CreateGuideComments < ActiveRecord::Migration
  def change
    create_table :guide_comments do |t|
      t.references :guide, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :guide_comments, :guides
    add_foreign_key :guide_comments, :comments
  end
end
