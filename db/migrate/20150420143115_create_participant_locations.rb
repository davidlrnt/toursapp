class CreateParticipantLocations < ActiveRecord::Migration
  def change
    create_table :participant_locations do |t|
      t.integer :participant_id, :location_id
      t.timestamps null: false
    end
  end
end

