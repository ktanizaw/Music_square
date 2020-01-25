class AddArtistBoardRefToBoardComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :board_comments, :artist_board, foreign_key: true
  end
end
