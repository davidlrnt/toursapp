class CreateParticipantTours < ActiveRecord::Migration
  def change
    create_table :participant_tours do |t|
      t.integer :participant_id, :tour_id
      t.timestamps null: false
      t.boolean :completed, null: false, default: false
    end
  end
end
