class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :participant_id, index: true
      t.references :tour, index: true

      t.text :content
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :reviews, :participants
    add_foreign_key :reviews, :tours
  end
end
