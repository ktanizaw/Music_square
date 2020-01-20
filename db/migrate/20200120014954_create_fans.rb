class CreateFans < ActiveRecord::Migration[5.2]
  def change
    create_table :fans do |t|
      t.integer :user_id
      t.integer :artist_board_id

      t.timestamps
    end
  end
end
