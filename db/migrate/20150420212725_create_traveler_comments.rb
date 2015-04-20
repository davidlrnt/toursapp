class CreateTravelerComments < ActiveRecord::Migration
  def change
    create_table :traveler_comments do |t|
      t.references :traveler, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :traveler_comments, :comments
  end
end
