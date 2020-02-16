class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|
      t.integer :user_id, null: false
      t.integer :artist_board_id, null: false

      t.timestamps
    end
  end
end
