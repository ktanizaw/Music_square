class AddColumnToBoardComment < ActiveRecord::Migration[5.2]
  def change
    add_column :board_comments, :picture, :string
    add_column :board_comments, :movie, :string
  end
end
