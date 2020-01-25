class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :participant, foreign_key: { to_table: :users }
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
