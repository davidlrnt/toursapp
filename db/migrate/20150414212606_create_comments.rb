class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :location, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :comments, :guide_id
    add_foreign_key :comments, :locations
  end
end
