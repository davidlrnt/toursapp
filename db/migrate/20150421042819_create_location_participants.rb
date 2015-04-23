class CreateLocationParticipants < ActiveRecord::Migration
  def change
    create_table :location_participants do |t|
      t.integer :location_id, :participant_id
      t.boolean :checkin
      t.timestamps null: false
    end
  end
end
