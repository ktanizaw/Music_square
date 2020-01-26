class AddArtistBoardRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :artist_board, foreign_key: true
  end
end
