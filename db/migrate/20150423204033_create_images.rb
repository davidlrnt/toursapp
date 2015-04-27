class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.string :image_url

      t.references :location
      t.references :tour
      t.integer :guide_id
      t.integer :participant_id
      t.references :comment
      t.references :review
      t.references :city

      t.timestamps null: false
    end
  end
end
