class ChangeColumnToFans < ActiveRecord::Migration[5.2]
  def up
    add_index :fans, [:user_id, :artist_board_id]
  end

  def down
    change_column :fans, :user_id, :integer
    change_column :fans, :artist_board_id, :integer
  end
end
