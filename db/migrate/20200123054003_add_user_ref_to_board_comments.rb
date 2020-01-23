class AddUserRefToBoardComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :board_comments, :user, foreign_key: true
  end
end
