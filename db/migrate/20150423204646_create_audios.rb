class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :audio_url
      t.references :location
      t.references :tour
      t.integer :guide_id
      t.integer :participant_id
      t.timestamps null: false
    end
  end
end
