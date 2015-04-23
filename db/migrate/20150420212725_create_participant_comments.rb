class CreateParticipantComments < ActiveRecord::Migration
  def change
    create_table :participant_comments do |t|
      t.references :participant, index: true
      t.references :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :participant_comments, :comments
  end
end
