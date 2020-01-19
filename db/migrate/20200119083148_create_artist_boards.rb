class CreateArtistBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_boards do |t|
      t.sring :artists
      t.text :albums
      t.text :profiles
      t.string :icon
      t.references :fan, foreign_key: true

      t.timestamps
    end
    add_index :artist_boards, :artists
  end
end
