class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_url
      t.references :location
      t.references :tour
      t.integer :guide_id
      t.integer :participant_id
      t.timestamps null: false
    end
  end
end
