class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :participant_id, index: true
      t.references :tour, index: true

      t.text :content
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users, column: :participant_id
    add_foreign_key :reviews, :tours
  end
end


    # add_foreign_key :reviews, :users, column: :author_id, primary_key: "participant_id"


