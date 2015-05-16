class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :participant_id, index: true
      t.integer :guide_id, index: true
      t.references :location, index: true
      t.references :tour, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :comments, :users, column: :participant_id
    add_foreign_key :comments, :users, column: :guide_id
    add_foreign_key :comments, :locations
    add_foreign_key :comments, :tours
  end
end
